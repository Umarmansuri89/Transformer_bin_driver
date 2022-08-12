import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/toast.dart';

class Booking_Wizard_controler extends GetxController{
  // final count = 0.obs;
  final TextEditingController search_Controller = TextEditingController(text: "");
  //inal TextEditingController chosenValue = TextEditingController(text: "");
   final fullName="".obs;
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







}
