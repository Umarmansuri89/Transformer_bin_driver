import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../routes/app_pages.dart';

class Otp_controller extends GetxController {


  final count = 0.obs;
  final TextEditingController textEditingController = TextEditingController(text: "");
  final isLoading = false.obs;
  final currentText = "".obs;
  var obscureNewPass = true.obs;
  bool hasError = false;
  StreamController<ErrorAnimationType>? errorController;

  final otp= "".obs;

  @override
  void onInit() {
    otp.value=Get.parameters['otp'].toString();
    // TODO: implement onInit
    super.onInit();
  }



  ///Get.parameters['countryid'].toString(),

  void onLogin() async {

    if(otp.value==textEditingController.text){

      Get.snackbar("OTP Verified", '',
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
      Get.toNamed(Routes.NEW_PASSWORD);

    }else{

      Get.snackbar("Wrong OTP", '',
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

    }



  }



  @override
  void onClose() {

  }


}
