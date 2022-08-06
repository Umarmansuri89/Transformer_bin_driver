import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final base_url = "".obs;
  // final girl_list = <GirlListModel>[].obs;
  // final FaqList = <ItemModel>[].obs;
  late SharedPreferences prefs;



  @override
  void onClose() {}

  void increment() => count.value++;

/*  void getVenueList() async {
    girl_list.clear();
    prefs = await SharedPreferences.getInstance();

    var response = await ApiService()
        .GirlList(prefs.getString(SDConstant.token).toString(), "top", "");
    print(response);
    if (response.containsKey('success')) {
      if (response['success'] == true) {
        List dataList = response['data']["list"].toList();
        base_url.value = response['data']['path'].toString();
        girl_list.value =
            dataList.map((json) => GirlListModel.fromJson(json)).toList();
      } else if (response['success'] == false) {
        //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
      }
    } else
      Toast.show("Something went wrong or No Connection !");
  }

  void getFAQ() async {
    FaqList.clear();
    var response = await ApiService().Faq();
    print({'$response'});
    if (response.containsKey('success')) {
      if (response['success'] == true) {
        List dataList = response['data'].toList();
        FaqList.value =
            dataList.map((json) => ItemModel.fromJson(json)).toList();
      } else if (response['success'] == false) {
        //  Get.toNamed(Routes.REGISTRATION, arguments: phoneController.text);
      }
    } else
      Toast.show("Something went wrong or No Connection !");
  }

  void getProfileDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await ApiService()
        .UserDetail(prefs.getString(SDConstant.token.toString()));
    print({'$response'});
    if (response.containsKey('success')) {
      if (response['success'] == true) {
        prefs.setString(SDConstant.name, response['data']['name'].toString());
        prefs.setString('profile_image', response['data']['image'].toString());

      } else if (response['success'] == false) {}
    } else
      Toast.show("Something went wrong or No Connection !");
  }*/
}
