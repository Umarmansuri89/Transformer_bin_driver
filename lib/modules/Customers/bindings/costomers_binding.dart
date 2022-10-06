import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';
import 'package:transformer_bin_driver/modules/Movements/controllers/movements_controller.dart';

import '../controllers/costomers_controller.dart';

class costomers_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<costomers_controller>(
          () => costomers_controller(),
    );
  }
}
