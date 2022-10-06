import 'package:get/get.dart';

import '../controllers/New_password_controller.dart';

class New_password_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<New_password_controller>(
      () => New_password_controller(),
    );
  }
}
