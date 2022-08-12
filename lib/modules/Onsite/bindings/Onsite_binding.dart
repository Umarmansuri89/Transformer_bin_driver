import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';

class Onsite_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Jobtype_controler>(
          () => Jobtype_controler(),
    );
  }
}
