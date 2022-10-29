import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/Contact_us_model.dart';
import '../../../utils/api_service.dart';
import '../../../utils/toast.dart';

class Logout_controller extends GetxController {
  //TODO: Implement AboutusController

  final count = 0.obs;
  final text_content = "".obs;

  @override
  void onInit() {
    super.onInit();
    getAbout();
    sd();
  }

  @override
  void onReady() {
    super.onReady();
    //buildLoading(Get.context!);
  }




  final user_name="".obs;
  sd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_name.value=prefs.getString('User_name')!;

  }
  final isLoading = false.obs;

  @override
  void onClose() {}

  void increment() => count.value++;
  final items = <Contect_us_model>[].obs;

  void getAbout() async {
    isLoading(true);
    var response = await ApiService().Contact_Us();
    print('responseanii[data]: ${response}');
      if (response['status']=="true") {
        List dataList = response['data'].toList();
        items.value = dataList.map((json) => Contect_us_model.fromJson(json)).toList();
        isLoading(false);
      } else if (response['status'] == "false") {
        Toast.show(response['msg']);
        isLoading(false);
      } else {
        isLoading(false);
        Toast.show("Something went wrong or No Connection !");
      }

  }

}