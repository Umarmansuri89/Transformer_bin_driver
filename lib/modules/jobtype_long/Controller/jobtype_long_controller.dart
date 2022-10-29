import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Model/Get_note_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/api_service.dart';
import '../../Deshboard/controllers/Dashboard_screen_controller.dart';

class jobtype_long_controler extends GetxController{
  final count = 0.obs;
  final isLoading = false.obs;
  final TextEditingController note_Controller = TextEditingController(text: "");
  Deshboard_screen_Controller controller1 = Get.put(Deshboard_screen_Controller());
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  final List<String> genderItems = [
    'card',
    'case',
  ];

  final selectedValue=''.obs;


  @override
  void onInit() {

    print('==========${Get.parameters['job_id'].toString()}');

    Job_Details();
    _getGeoLocationPosition();
    getAddress();
  //  pdf_downloder();

    // TODO: implement onInit
    super.onInit();
  }

  final Delivery_status="".obs;
  final bin_payment_status="".obs;

  final Note_items = <Get_node_model>[].obs;

  final id="".obs;
  final job_status="".obs;
  final product_name="".obs;
  final product_size="".obs;
  final waste_type="".obs;
  final bin_type="".obs;
  final scheduled_date="".obs;
  final amount="".obs;
  final product_image="".obs;
  final payment_mode="".obs;
  final payment_status="".obs;
  final outstanding="".obs;
  final customer_name="".obs;
  final customer_email="".obs;
  final customer_address="".obs;
  final customer_mobile="".obs;
  final customer_company_name="".obs;
  final customer_invoice="".obs;
  final latitude="".obs;
  final longitude="".obs;
  final order_number="".obs;

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


//pdf

  // pdf_downloder() async {
  //   final taskId = await FlutterDownloader.enqueue(
  //     url: 'https://xugar.me/demo/mock/transformer-bin-hire/uploads/invoice/1665664894_order.pdf',
  //     savedDir: 'the path of directory where you want to save downloaded files',
  //     showNotification: true, // show download progress in status bar (for Android)
  //     openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  //   );
  //   final tasks = await FlutterDownloader.loadTasks();
  // }


  //googlemep

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


  getAddress() async {
    try {
      Position position = await _getGeoLocationPosition();

      List placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      String? Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

      print(Address);

      print("${position.latitude}, ${position.longitude}");
     var latitude = double.parse(position.latitude.toString());
     var longitude = double.parse(position.longitude.toString());

      print("=============$latitude");
      print("=============$longitude");
      onAddMarkerButtonPressed(LatLng(position.latitude,position.longitude));

    } catch (e) {
      print(e);
    }
  }

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



  onAddMarkerButtonPressed(LatLng lastMapPosition) {

    place_markers.clear();
    print("==============$lastMapPosition");
    place_markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId("1233"),
      position: lastMapPosition,
      infoWindow: const InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
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



  //===================================end



  //==========call code

  callNumber() async{
    var number = customer_mobile.value; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }



  //===============msg code

  final message="".obs;


  Future<void> sendSMS1() async {
    try {
      String _result = await sendSMS(
        message: "",
        recipients: [customer_mobile.value],
        sendDirect: false,
      );
      message.value = _result;
    } catch (error) {
      message.value = error.toString();
    }
  }

  //===============end msg code

  void Job_Details() async {
    isLoading(true);
    var response = await ApiService().GetJobDetail(Get.parameters['job_id'].toString(),Get.parameters['user_id'].toString());
    print(response);

    if (response['status'] == "true") {

      id.value=response['data']['id'];
      job_status.value=response['data']['delivery_status'];
      product_name.value=response['data']['product_name'];
      product_size.value=response['data']['product_size'];
      waste_type.value=response['data']['waste_type'];
      bin_type.value=response['data']['bin_type'];
      scheduled_date.value=response['data']['scheduled_date'];
      amount.value=response['data']['amount'];
      product_image.value=response['data']['product_image'];
      payment_mode.value=response['data']['payment_mode'];
      payment_status.value=response['data']['payment_status'];
      outstanding.value=response['data']['outstanding'].toString();
      customer_name.value=response['data']['customer_name'];
      customer_email.value=response['data']['customer_email'];
      customer_address.value=response['data']['customer_address'];
      customer_mobile.value=response['data']['customer_mobile'];
      customer_company_name.value=response['data']['customer_company_name'];
      customer_invoice.value=response['data']['customer_invoice'];
      latitude.value=response['data']['latitude'];
      longitude.value=response['data']['longitude'];
      order_number.value=response['data']['order_number'];

      onAddMarkerButtonPressed(LatLng(double.parse(latitude.value), double.parse(longitude.value)));
      print("latitude===========${double.parse(latitude.value)}");
      print("longitude===========${double.parse(longitude.value)}");
      lastMapPosition=LatLng(double.parse(latitude.value), double.parse(longitude.value));
      isLoading(false);

      GetNote(controller1.DriverID.toString(),id.value.toString(),);

    } else if (response['status'] == "false") {

      isLoading(false);
      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }

  }


  void Add_nots(driver_id,job_id) async {

    isLoading(true);
    var response = await ApiService().Notes(driver_id,job_id,note_Controller.text);
    print(response);

    if (response['status'] == "true") {

      Get.snackbar("Note Add Successfuly",'',
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

      note_Controller.clear();
      GetNote(driver_id,job_id);
      isLoading(false);

    } else if (response['status'] == "false") {


      isLoading(false);

      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }

  }


  void Send_rercipt(order_number) async {

    isLoading(true);
    var response = await ApiService().Send_Receipt(order_number);
    print(response);

    if (response['status'] == "true") {

      Get.snackbar("${response['msg'].toString()}",'',
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


      isLoading(false);

    } else if (response['status'] == "false") {

      isLoading(false);
      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }

  }

  void GetNote(driver_id,job_id) async {
    isLoading(true);
    var response = await ApiService().GetNote(driver_id,job_id);
    print(response);

    if (response['status'] == "true") {

      List dataList = response['data'].toList();
      Note_items.value = dataList.map((json) => Get_node_model.fromJson(json)).toList();

      print("Note_items===========${Note_items.value}");

      isLoading(false);

    } else if (response['status'] == "false") {

      isLoading(false);
      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }

  }


  Future FileUpload() async {
    isLoading(true);
    var postUri = Uri.parse(ApiService.BASE_URL + ApiService.UPDATE_JOB_STATUS);
    var request = new http.MultipartRequest("POST", postUri);

    request.fields["job_id"] = id.value;
    request.fields["status"] = Delivery_status.value;
    request.fields["payment_status"] = bin_payment_status.value;
    request.fields["user_id"] = controller1.DriverID.value.toString();

    print("TTTTTTTTTT========= " + imageFile.path);
    print("TTTTTTTTTT========= ${id.value}");
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
          //bin_payment_status.value="";



          isLoading(false);

          Get.back();


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
    }).catchError((err) {
      print('error : ' + err.toString());
      isLoading(false);
    }).whenComplete(() {

    });
  }

  void onDashboard() async {
    Get.toNamed(Routes.INFORMTION);
  }

}
