import 'package:get/get.dart';

import '../controllers/Logout_controller.dart';

class Logout_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logout_controller>(
      () => Logout_controller(),
    );
  }
}
