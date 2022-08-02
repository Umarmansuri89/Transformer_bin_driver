import 'package:get/get.dart';

import '../controllers/Burger_manu_controller.dart';



class Burger_manu_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Burger_manu_Controller>(
      () => Burger_manu_Controller(),
    );
  }
}
