import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController(text: "");
  var isLoading = false.obs;
  final TextEditingController passwordcontroller = TextEditingController(text: "");
  var obscureNewPass = true.obs;


  void onLogin() async {
  //  Get.toNamed(Routes.DASHBOARD_SCREEN);
  }



  @override
  void onClose() {

  }

  // void navigateUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var loginstatus=prefs.getString('loginstatus');
  //   String status = SharedPreferencesUtils.getString(SDConstant.token).toString();
  //   print("status"+status);
  //
  //   loginstatus=="true"
  //       ? Get.offAllNamed(Routes.DASHBOARD)
  //       : Get.offAllNamed(Routes.WELCOME);
  // }

}
