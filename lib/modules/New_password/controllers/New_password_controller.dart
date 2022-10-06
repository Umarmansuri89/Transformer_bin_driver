import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';

class New_password_controller extends GetxController {
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController(text: "");
  final isLoading = false.obs;
  final TextEditingController passwordcontroller = TextEditingController(text: "");
  var obscureNewPass = true.obs;
  //final isLoading = true.obs;


  void onLogin() async {

    if(emailController.text==passwordcontroller.text){


      New_pass();


    }else{

      Get.snackbar('Password Not Match', '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xffEC297B),
        // padding: EdgeInsets.symmetric(
        //     vertical: 5,horizontal: 5
        // ),
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

  void New_pass() async {
    try {
      isLoading(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();
       var User_id=prefs.getString('User_id');

      var response = await ApiService()
          .Reset_password(passwordcontroller.text,User_id.toString());
      print({'$response'});
      if (response['status'] == "true") {

        Get.toNamed(Routes.LOGIN);



        Get.snackbar('New Password Set Successfully', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xffEC297B),
          // padding: EdgeInsets.symmetric(
          //     vertical: 5,horizontal: 5
          // ),
          barBlur: 0,
          colorText: Colors.white,
          maxWidth: double.infinity,
          snackStyle: SnackStyle.GROUNDED,
          borderRadius: 10,);

      } else if (response['status'] == "false") {

        Get.snackbar(response['message'].toString(), '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xffEC297B),
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
