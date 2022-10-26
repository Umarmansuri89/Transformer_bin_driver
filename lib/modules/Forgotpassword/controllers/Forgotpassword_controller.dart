import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';

class Forgotpassword_controller extends GetxController {
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController(text: "");
  final isLoading = false.obs;
  var obscureNewPass = true.obs;
  //final isLoading = true.obs;


  void onLogin() async {
    Get.toNamed(Routes.OTP);
  }



  @override
  void onClose() {
  }

  void Forgot_pass() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .forgetpassword(emailController.text);
      print({'$response'});

      if (response['status'] == "true") {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('User_id', response['data']['userid'].toString());

        Get.snackbar(response['status'].toString(), '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xffec8b29),
          barBlur: 0,
          colorText: Colors.white,
          maxWidth: double.infinity,
          snackStyle: SnackStyle.GROUNDED,
          borderRadius: 20,);

        var data={
          "otp": response['data']['otp'].toString()
        };

        Get.offAllNamed(Routes.OTP,parameters: data);


      } else if (response['status'] == "false") {

        Get.snackbar(response['message'].toString(), '',
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
    } finally {
      isLoading(false);
    }
  }



}
