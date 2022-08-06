import 'package:get/get.dart';

import '../../Payment_due/controller/Payment_due_controller.dart';

class Schedule_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Payment_due_controller>(
          () => Payment_due_controller(),
    );
  }
}
