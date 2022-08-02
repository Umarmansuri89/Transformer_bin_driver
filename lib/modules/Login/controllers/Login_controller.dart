import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/shared_prefrence/shared_preferences_singleton.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController(text: "");
  var isLoading = false.obs;
  final TextEditingController passwordcontroller = TextEditingController(text: "");
  var obscureNewPass = true.obs;


  void onLogin() async {
    Get.toNamed(Routes.BURGER_MANU);
  }

  @override
  void onInit() {
    super.onInit();
  //  Future.delayed(Duration(seconds: 5), navigateUser);
  }

  @override
  void onReady() {
    super.onReady();
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
