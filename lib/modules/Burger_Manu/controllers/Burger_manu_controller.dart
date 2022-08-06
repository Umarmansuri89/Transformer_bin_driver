import 'package:get/get.dart';

import '../../../routes/app_pages.dart';


class Burger_manu_Controller extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;
  final current = 0.obs;




  @override
  void onClose() {}

  void increment() => count.value++;

  void onDashboard() async {
    Get.toNamed(Routes.DASHBOARD_SCREEN);
  }

  void onSCHED() async {
    Get.toNamed(Routes.SCHED);
  }

  void onPaymentDue() async {
    Get.toNamed(Routes.PAYMENT_DUE);
  }

  // void getAdvertisementList() async {
  //   advertisementList.add("");
  //   advertisementList.add("");
  //   advertisementList.add("");
  // }
}
