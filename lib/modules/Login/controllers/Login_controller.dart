import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController(text: "");
  final isLoading = false.obs;
  final TextEditingController passwordcontroller = TextEditingController(text: "");
  var obscureNewPass = true.obs;
  //final isLoading = true.obs;
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');





  void onLogin() async {
    Get.toNamed(Routes.DASHBOARD_SCREEN);
  }





  @override
  void onClose() {

  }

  void getLogin() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Login(emailController.text, passwordcontroller.text);
      print({'$response'});
        if (response['status'] == "true") {

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(SDConstant.token, response['token'].toString());
          prefs.setString(SDConstant.isLogin, "true");
          prefs.setString('loginstatus', "true");
          prefs.setString('User_id', response['data']['userid'].toString());

          Get.snackbar('Login Successfully', '',
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
          Get.offAllNamed(Routes.DASHBOARD_SCREEN);

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
