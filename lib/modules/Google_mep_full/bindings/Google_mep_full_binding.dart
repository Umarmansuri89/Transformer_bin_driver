import 'package:get/get.dart';

import '../controllers/Google_mep_full_controller.dart';


class Google_mep_full_binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<Google_mep_full_controller>(
      () => Google_mep_full_controller(),
    );
  }
}
