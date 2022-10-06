import 'package:get/get.dart';

import '../controllers/Otp_controller.dart';

class Otp_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Otp_controller>(
      () => Otp_controller(),
    );
  }
}
