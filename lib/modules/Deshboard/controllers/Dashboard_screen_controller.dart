import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transformer_bin_driver/Model/Payment_model.dart';

import '../../../Model/My_jobs_model.dart';
import '../../../Model/Year_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';



class Deshboard_screen_Controller extends GetxController {
  final count = 0.obs;
  final textColor = 0xffFFFFFF.obs;
  var isLoading = false.obs;
  final Hide_leading=[].obs;
  final static_Status_list=[0,0,0,0,0,1,0,0,0,0].obs;

  final IsVisible=false.obs;

  var Colorlist = [].obs;
  final current = 0.obs;
  final dob = "00/00/0000".obs;
  final dateSelected = "".obs;
  final List<GlobalKey<ExpansionTileCardState>> cardKeyList = [];
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  DateTime currentDate = DateTime.now();
  final items = <My_jobs_model>[].obs;
  final YearList = <Year_Model>[].obs;
  final PaymentList = <Payment_Model>[].obs;


  @override
  void onInit() {
    sd();
    Todaydate();
    _getGeoLocationPosition();
    getAddress();
    My_jobs();
    GET_YEAR();
    GET_PAMENT_LIST();
    // TODO: implement onInit
    super.onInit();
  }

  var formattedDate_one="";


  // SharedPreferences
  final user_name="".obs;


  sd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_name.value=prefs.getString('User_name')!;
  }


  //today date
  Todaydate(){

    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    var formatter_one = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
     formattedDate_one = formatter_one.format(now);
    print(formattedDate);

    dob.value=formattedDate;// 2016-01-25

  }


  //year piker

  yearpiker(context) async {
    DateTime? newDateTime= await showRoundedDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      theme: ThemeData(primarySwatch: Colors.green),
    );
    print("==========$newDateTime");
  }





  final  Month= [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

  final selectedValue=''.obs;
  final Select_year=''.obs;
  final Select_munth=''.obs;




  DateTime get selectedDate =>
      DateTime(currentDate.year, currentDate.month, currentDate.day);
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  TextEditingController dobCntroller = TextEditingController(text: "");
  TextEditingController dayController = TextEditingController(text: "");




  //google location
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  //String googleAPiKey = "AIzaSyDma7ThRPGokuU_cJ2Q_qFvowIpK35RAPs";
  String googleAPiKey = "AIzaSyBHjDOZHzSd2iPofvHEACOOUISFXPWoY1s";

  Set<Marker> markers1 = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  double distance = 0.0;


  Set<Marker> markers = {};




// Method for retrieving the address
  final startAddressController = TextEditingController();

  Position? currentPosition;

  final currentAddress="".obs;
  final startAddress="".obs;


  Future _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }


  late double latitude=0.0;
  late double longitude=0.0;


  getAddress() async {
    try {
      Position position = await _getGeoLocationPosition();

      List placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      String? Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

      print(Address);

      print("${position.latitude}, ${position.longitude}");
      latitude = double.parse(position.latitude.toString());
      longitude = double.parse(position.longitude.toString());

      print("=============$latitude");
      print("=============$longitude");
      onAddMarkerButtonPressed(LatLng(position.latitude,position.longitude),"");

    } catch (e) {
      print(e);
    }
  }


  // LatLng? startLocation=S;
  // LatLng? endLocation;

  LatLng startLocation = LatLng(22.683314,75.835821);
  LatLng endLocation = LatLng(22.683789,75.829551);


  selectDatedialog(context) async {
    final DateTime? picked = await showRoundedDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate:
      DateTime(currentDate.year, currentDate.month, currentDate.day + 1),
      firstDate: DateTime(1950, 01, 01),
      theme: ThemeData(
        primaryColor: Colors.grey.shade100,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Theme.of(context).primaryColor),
          caption: TextStyle(color: Theme.of(context).primaryColor),
        ),
        dialogBackgroundColor: Colors.grey.shade100,
        disabledColor: Colors.grey.shade400, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Theme.of(context).primaryColor),
      ),
    );
    if (picked != null)
      dob.value = formatter.format(picked).toString();

    formattedDate_one=dob.value;

    My_jobs();

    print(dob.value);


  }


  final Drivername="".obs;
  int select=-1;
  final DriverID="".obs;
  final bin_payment_status="".obs;
  final Delivery_status="".obs;
  final bin_id="".obs;


  late File imageFile;
  /// Get from gallery
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      FileUpload();
    }
  }

  /// Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      FileUpload();
    }
  }

  Future FileUpload() async {

    isLoading(true);
    var postUri = Uri.parse(ApiService.BASE_URL + ApiService.UPDATE_JOB_STATUS);
    var request = new http.MultipartRequest("POST", postUri);

    request.fields["job_id"] = bin_id.value;
    request.fields["status"] = Delivery_status.value;
    request.fields["payment_status"] = bin_payment_status.value;
    request.fields["user_id"] =  DriverID.value;

    print("TTTTTTTTTT========= " + imageFile.path);
    print("TTTTTTTTTT========= ${bin_id.value}");
    print("TTTTTTTTTT========= ${Delivery_status.value}");
    print("TTTTTTTTTT========= ${bin_payment_status.value}");

    if (imageFile.path != "" && imageFile.path != null) {
      print('Not null');
      http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('image', imageFile.path);
      request.files.add(multipartFile);
    } else {
      print('null null');
    }
    request
        .send()
        .then((result) async {
      http.Response.fromStream(result).then((response) {
        var jsonString = jsonDecode(response.body);
        if (jsonString['status'] =="true") {
          Get.snackbar("Successfuly",'',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xffec9e29),
            padding: EdgeInsets.symmetric(
                vertical: 5, horizontal: 5
            ),
            barBlur: 0,
            colorText: Colors.white,
            maxWidth: double.infinity,
            snackStyle: SnackStyle.GROUNDED,
            borderRadius: 10,);
          bin_payment_status.value="";
          My_jobs();
          isLoading(false);

        } else {

          Get.snackbar("Failed",'',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            padding: EdgeInsets.all(10),
            barBlur: 0,
            colorText: Colors.white,
            maxWidth: double.infinity,
            snackStyle: SnackStyle.GROUNDED,
            borderRadius: 10,);

        }
        isLoading(false);
        return response.body;
      });
    })
        .catchError((err) {
      print('error : ' + err.toString());
      isLoading(false);

    }
    )
        .whenComplete(() {

    });
  }



  Future Markoff() async {

    isLoading(true);
    var postUri = Uri.parse(ApiService.BASE_URL + ApiService.UPDATE_JOB_STATUS);
    var request = new http.MultipartRequest("POST", postUri);

    request.fields["job_id"] = bin_id.value;
    request.fields["status"] = Delivery_status.value;
    request.fields["user_id"] = DriverID.value;

    print("TTTTTTTTTT========= ${bin_id.value}");
    print("TTTTTTTTTT========= ${Delivery_status.value}");

    request
        .send()
        .then((result) async {
      http.Response.fromStream(result).then((response) {
        var jsonString = jsonDecode(response.body);
        if (jsonString['status'] =="true") {
          Get.snackbar("Reject Successfuly",'',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xffec9e29),
            padding: EdgeInsets.symmetric(
                vertical: 5, horizontal: 5
            ),
            barBlur: 0,
            colorText: Colors.white,
            maxWidth: double.infinity,
            snackStyle: SnackStyle.GROUNDED,
            borderRadius: 10,);

          My_jobs();
          isLoading(false);

        } else {

          Get.snackbar("Failed",'',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            padding: EdgeInsets.all(10),
            barBlur: 0,
            colorText: Colors.white,
            maxWidth: double.infinity,
            snackStyle: SnackStyle.GROUNDED,
            borderRadius: 10,);

        }
        isLoading(false);
        return response.body;
      });
    })
        .catchError((err) {
      print('error : ' + err.toString());
      isLoading(false);

    }
    )
        .whenComplete(() {

    });
  }


  void My_jobs() async {
    items.value.clear();
    isLoading(true);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    print("=====${preferences.getString(SDConstant.token).toString()}");
    print("=====${preferences.getString('User_id').toString()}");
    print("formattedDate_one=====${formattedDate_one}");
    var response = await ApiService().my_jobs(preferences.getString('User_id').toString(),formattedDate_one);
    print(response);

      if (response['status'] == "true") {
        List dataList = response['data'].toList();
        items.value = dataList.map((json) => My_jobs_model.fromJson(json)).toList();

        DriverID.value=items.value[0].driver_id;

       print("====================${items.value}");

       isLoading(false);

      } else if (response['status'] == "false") {

        isLoading(false);

        //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
      }
  }

  void GET_YEAR() async {
    YearList.value.clear();
    isLoading(true);
    var response = await ApiService().Get_Year_List();
    print(response);

    if (response['status'] == "true") {
      List dataList = response['data'].toList();
      YearList.value = dataList.map((json) => Year_Model.fromJson(json)).toList();

      print("====================${YearList.value}");

      isLoading(false);

    } else if (response['status'] == "false") {

      isLoading(false);
      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }

  }




  void GET_PAMENT_LIST() async {
    PaymentList.value.clear();
    isLoading(true);
    var response = await ApiService().Get_Payment_List();
    print(response);

    if (response['status'] == "true") {


      List dataList = response['data'].toList();
      PaymentList.value = dataList.map((json) => Payment_Model.fromJson(json)).toList();

      print("====================${PaymentList.value}");

      isLoading(false);

    } else if (response['status'] == "false") {

      isLoading(false);
      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }

  }



  //google place mark

  Completer<GoogleMapController> controller = Completer();

  static const LatLng center = LatLng(-33.8914098, 151.176382);

  final Set<Marker> place_markers = {};

  LatLng lastMapPosition = center;

  MapType currentMapType = MapType.normal;


  void onMapTypeButtonPressed() {
      currentMapType = currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
  }

   onAddMarkerButtonPressed(LatLng lastMapPosition,String address) {

    place_markers.clear();
    print("==============$lastMapPosition");
    place_markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("1233"),
        position: lastMapPosition,
        infoWindow: InfoWindow(
          title: address,
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

    print("============+$place_markers");
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  void onMapCreated(GoogleMapController controller1) {
    controller.complete(controller1);
  }



  @override
  void onClose() {}



  void increment() => count.value++;

  void onDashboard() async {
    //Get.toNamed(Routes.DASHBOARD);
  }

  void onPaymentDue() async {
    Get.toNamed(Routes.PAYMENT_DUE);
  }

  void onNotAssigned() async {
    Get.toNamed(Routes.SCHEDULE);
  }

  void onInfo() async {

  }

  void onJobtype() async {
    Get.toNamed(Routes.JOBTYPE);
  }

}
