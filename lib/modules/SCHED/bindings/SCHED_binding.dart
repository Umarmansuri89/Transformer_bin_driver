import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/SCHED_controller.dart';



class SCHED_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SCHED_controler>(
          () => SCHED_controler(),
    );
  }
}