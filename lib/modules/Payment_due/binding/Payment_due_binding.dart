import 'package:get/get.dart';

import '../controller/Payment_due_controller.dart';

class Payment_due_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Payment_due_controller>(
          () => Payment_due_controller(),
    );
  }
}
