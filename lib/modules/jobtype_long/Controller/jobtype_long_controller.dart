import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class jobtype_long_controler extends GetxController{
  final count = 0.obs;
  final TextEditingController note_Controller = TextEditingController(text: "");
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  void onDashboard() async {
    Get.toNamed(Routes.INFORMTION);
  }

}
