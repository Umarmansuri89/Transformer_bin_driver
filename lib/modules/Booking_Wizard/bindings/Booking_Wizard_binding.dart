import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';

import '../controllers/Booking_Wizard_controller.dart';

class Booking_Wizard_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Booking_Wizard_controler>(
          () => Booking_Wizard_controler(),
    );
  }
}
