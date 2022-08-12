import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';

import '../controllers/Jobtype_status_controller.dart';

class Jobtype_status_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Jobtype_status_controler>(
          () => Jobtype_status_controler(),
    );
  }
}
