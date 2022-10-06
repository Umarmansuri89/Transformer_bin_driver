import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';
import 'package:transformer_bin_driver/modules/Movements/controllers/movements_controller.dart';

class movements_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<movements_controller>(
          () => movements_controller(),
    );
  }
}
