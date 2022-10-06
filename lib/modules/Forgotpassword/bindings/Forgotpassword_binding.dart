import 'package:get/get.dart';

import '../controllers/Forgotpassword_controller.dart';

class Forgotpassword_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Forgotpassword_controller>(
      () => Forgotpassword_controller(),
    );
  }
}
