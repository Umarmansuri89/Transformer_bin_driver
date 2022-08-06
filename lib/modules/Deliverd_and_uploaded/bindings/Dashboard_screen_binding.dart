import 'package:get/get.dart';

import '../controllers/Dashboard_screen_controller.dart';


class Deshboard_screen_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Deshboard_screen_Controller>(
      () => Deshboard_screen_Controller(),
    );
  }
}
