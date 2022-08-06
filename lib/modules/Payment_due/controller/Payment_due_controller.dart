import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class Payment_due_controller extends GetxController{
  // final count = 0.obs;

  // final TextEditingController note_Controller = TextEditingController(text: "");


  void onInfo() async {
    Get.toNamed(Routes.INFORMTION);
  }

}