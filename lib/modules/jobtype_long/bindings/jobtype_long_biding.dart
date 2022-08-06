import 'package:get/get.dart';

import '../Controller/jobtype_long_controller.dart';

class jobtype_long_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<jobtype_long_controler>(
          () => jobtype_long_controler(),
    );
  }
}
