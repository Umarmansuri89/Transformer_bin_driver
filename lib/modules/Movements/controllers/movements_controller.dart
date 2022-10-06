import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class movements_controller extends GetxController{
  // final count = 0.obs;
  final TextEditingController note_Controller = TextEditingController(text: "");

  final fullName="".obs;
  final status=false.obs;
  final chosenValue = "".obs;
  final list = ["a","b","c","d","e","f"].obs;
  //final selectedValue="".obs;
  final  items = ["dddsd"];
  var isLoading = false.obs;
  void onDashboard() async {
    // Get.toNamed(Routes.INFORMTION);
  }





  final selectedValue_1 = "".obs;
  final selectedValue_city = "".obs;
  String? selectedValue;
  String? selectedValue1;



  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  // void onDashboard() async {
  //   Get.toNamed(Routes.INFORMTION);
  // }

}
