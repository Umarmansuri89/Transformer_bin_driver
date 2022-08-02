import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';


class DashboardController extends GetxController {
  /*final item = [].obs;
  final advertisementList = <String>[].obs;
  final categoryList_all = [].obs;
  final package_id = 0.obs;
  final bar_title = "".obs;

  final baseUrl_category = "".obs;
  final baseUrl_advertisement = "".obs;
  final baseUrl_event = "".obs;
  final username = "".obs;
  final count = 0.obs;
  final current = 0.obs;
  final bool_isLogin = false.obs;
*/
  String token = "";
  late SharedPreferences prefs;

  final persistentTabController = PersistentTabController();
  bool hideNavBar = false;


  final List screens = [
    HomeView(),
    Scaffold(
      body: Center(
        child: Text('B'),
      ),
    ),
   // AnalyticsScreen(),
    Scaffold(
      body: Center(
        child: Text('C'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('D'),
      ),
    ),
  ];

  var isLoading = false.obs;
 final currentIndex = 0.obs;

  List<IconData> listOfIconsLight = [
    Icons.audiotrack,
    Icons.audiotrack,
    Icons.favorite,
    Icons.audiotrack,
  ];
  List<IconData> listOfIconsBold = [
    IconlyBold.category,
    IconlyBold.chart,
    IconlyBold.document,
    IconlyBold.work
  ];

  List<String> listOfText = ['DashBoard', 'Analytics', 'My Products', 'Manage'];






  final homeController = Get.put(HomeController());


  /*final discoverGirlController = Get.put(DiscoverGirlController());
  final homeController = Get.put(HomeController());
  final partyDetailController = Get.put(PartyDetailController());
  final cityListController = Get.put(CityListController());
  final countryListController = Get.put(CountryListController());
  final faqController = Get.put(faq_new_controller_with_back_button());
  final settingContrller = Get.put(SettingsController());*/

  @override
  void onInit() {
    super.onInit();

    hideNavBar = false;


    homeController.onInit();
    // discoverGirlController.onInit();
    // //  homeController.onInit();
    // partyDetailController.onInit();
    // cityListController.onInit();
    // countryListController.onInit();
    // settingContrller.onInit();

    /*  FirebaseMessaging.instance.getInitialMessage().then((message) {
      //print('getInitialMessage => display: ${message?.notification?.title}');
      // print('display: ${message?.notification?.body}');
      print('display: ${message?.data.toString()}');
      if (message != null) {
        LocalNotificationService.display(message);
      }
    });

    FirebaseMessaging.onMessage.listen((message) {
      print('onMessage => display: ${message.notification?.title}');
      print('display: ${message.notification?.body}');
      print('display: ${message.data.toString()}');
      LocalNotificationService.display(message);
    });

    //app open
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("onMessageOpenedApp" + message.toString());
      print('onMessageOpenedApp => display: ${message.notification?.title}');
      print('display: ${message.notification?.body}');
      print('display: ${message.data.toString()}');
      LocalNotificationService.display(message);
    });*/
  }

  @override
  void onClose() {
    homeController.onClose();
   /* faqController.onClose();
    discoverGirlController.onClose();
    homeController.onClose();
    partyDetailController.onClose();
    cityListController.onClose();
    settingContrller.onClose();*/
  }


}
