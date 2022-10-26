import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/shared_prefrence/shared_preferences_singleton.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    print("==============next");
    super.onInit();

    Future.delayed(Duration(seconds: 5), navigateUser);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  void navigateUser() async {
    print("==============next");

    //Get.offAllNamed(Routes.LOGIN);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginstatus=prefs.getString('loginstatus');
    String status = SharedPreferencesUtils.getString(SDConstant.token).toString();
    print("status"+status);

    loginstatus=="true"
        ? Get.offAllNamed(Routes.DASHBOARD_SCREEN)
        : Get.offAllNamed(Routes.LOGIN);
  }

}
