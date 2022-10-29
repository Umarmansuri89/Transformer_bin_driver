import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Deshboard/controllers/Dashboard_screen_controller.dart';
import '../controllers/Google_mep_full_controller.dart';


class Google_mep_full_view extends StatefulWidget {
  const Google_mep_full_view({Key? key}) : super(key: key);

  @override
  State<Google_mep_full_view> createState() => _Google_mep_full_viewState();
}

class _Google_mep_full_viewState extends State<Google_mep_full_view> {

  Google_mep_full_controller controller = Get.put(Google_mep_full_controller());
  Deshboard_screen_Controller controller1 = Get.put(Deshboard_screen_Controller());


  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  //String googleAPiKey = "AIzaSyDma7ThRPGokuU_cJ2Q_qFvowIpK35RAPs";
  String googleAPiKey = "AIzaSyApM3UtlRzy4x1801CgWkiHHnZWX4lsuuo";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction


  LatLng endLocation = LatLng(double.parse(Get.parameters['let'].toString()), double.parse(Get.parameters['long'].toString()));

  double distance = 0.0;





  @override
  void initState() {
    print('==========${Get.parameters['let'].toString()}');
    print('==========${Get.parameters['long'].toString()}');
    Location();
    getDirections();
    //fetch direction polylines from Google API
    super.initState();
  }







  Location() async {

    String? address= Get.parameters['address'].toString();
    markers.add(Marker( //add start location marker
        markerId: MarkerId(""),
        position: LatLng(controller1.latitude,controller1.longitude), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Starting Point',
          snippet: 'Start Marker',
        ),
     // icon: BitmapDescriptor.defaultMarker,
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(20, 20)), 'assets/Images/images.png'
        )
    ));
    markers.add(Marker(

      //add distination location marker
        markerId: MarkerId(endLocation.toString()),
        position: endLocation,
        //position of marker
        infoWindow: const InfoWindow( //popup info
          title: '',
          snippet: '',
        ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }


  getDirections() async {

    print("+++++++++++++++++++${controller1.latitude}");
    print("+++++++++++++++++++${controller1.longitude}");

    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(controller1.latitude,controller1.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }


    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for(var i = 0; i < polylineCoordinates.length-1; i++){
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i+1].latitude,
          polylineCoordinates[i+1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );

    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


  @override
  Widget build(BuildContext context) {
    print("==========");
    controller1.getAddress();
    return Scaffold(
      // color: Color(0xff0D0B21),
        body :
        Container(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                  child: CupertinoActivityIndicator()
              );
            } else {
              return Container(
                child:  GoogleMap(
                  compassEnabled: true,
                  tiltGesturesEnabled:true,
                  indoorViewEnabled:true,
                  ///trafficEnabled:true,
                  buildingsEnabled:true,
                  //liteModeEnabled: true,
                  //Map widget from google_maps_flutter package
                  mapToolbarEnabled: true,
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,

                  //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition( //innital position in map
                    target: LatLng(controller1.latitude,controller1.longitude), //initial position
                    zoom: 14.0, //initial zoom level
                  ),
                  markers: markers,
                  //markers to show on map
                  polylines: Set<Polyline>.of(polylines.values), //polylines
                  mapType: MapType.normal, //map type
                  onMapCreated: (controller) { //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
              );
            }
          }),
        )

    );
  }
}

// onSubmit() {
//   Get.toNamed(Routes.LOGIN);
// }
//
// void onNextPress() {
//   print("onNextPress caught");
// }
