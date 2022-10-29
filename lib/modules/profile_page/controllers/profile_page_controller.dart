import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';
import 'package:http/http.dart' as http;
class ProfilePageController extends GetxController {
  //TODO: Implement ProfilePageController

  final count = 0.obs;
   final attachmentPath = "".obs;
   String attachmentPath1 = "";
  final imageUrl = "".obs;
  late SharedPreferences prefs;
  String token = "";
  late File imageFile;
   final loder = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mobile = TextEditingController();

  TextEditingController email = TextEditingController();




  @override
 void onInit() async {
    My_profile();
   // User_detail();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;


  final isLoading=false.obs;


  /*{
        "status": "true",
    "msg": "Data Found",
    "data": {
    "first_name": "Umar",
    "last_name": "Mansuri",
    "email": "mansuriumar89@gmail.com",
    "mobile": "9630785444"
    }*/






  void My_profile() async {
    isLoading(true);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    print("=====${preferences.getString(SDConstant.token).toString()}");
    print("=====${preferences.getString('User_id').toString()}");
    var response = await ApiService().My_Profile(preferences.getString('User_id').toString());
    print(response);

    if (response['status'] == "true") {


      name.text=response['data']['first_name'];
      lastname.text=response['data']['last_name'];
      email.text=response['data']['email'];
      mobile.text=response['data']['mobile'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('User_name', response['data']['first_name'].toString()+" "+response['data']['last_name'].toString());
      isLoading(false);

    } else if (response['status'] == "false") {

      isLoading(false);

      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }
  }

  void Update_profile() async {
    isLoading(true);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    print("=====${preferences.getString(SDConstant.token).toString()}");
    print("=====${preferences.getString('User_id').toString()}");
    var response = await ApiService().Update_Profile(preferences.getString('User_id').toString(),name.text.toString(),lastname.text.toString(),mobile.text.toString());
    print(response);

    if (response['status'] == "true") {

      Get.snackbar('Profile Update Successfully', '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xffec8b29),
        padding: EdgeInsets.symmetric(
            vertical: 5,horizontal: 5
        ),
        barBlur: 0,
        colorText: Colors.white,
        maxWidth: double.infinity,
        snackStyle: SnackStyle.GROUNDED,
        borderRadius: 10,);


      My_profile();

      isLoading(false);

    } else if (response['status'] == "false") {

      isLoading(false);

      //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
    }
  }

}
