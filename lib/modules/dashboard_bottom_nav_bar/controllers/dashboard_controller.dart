import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../local_notification_service.dart';
import '../../Deshboard/controllers/Dashboard_screen_controller.dart';
import '../../Logout/controllers/Logout_controller.dart';
import '../../aboutus/controllers/aboutus_controller.dart';
import '../../profile_page/controllers/profile_page_controller.dart';


class DashboardController extends GetxController {
  final item = [].obs;
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

  String token = "";
  late SharedPreferences prefs;

  final persistentTabController = PersistentTabController();
  bool hideNavBar = false;


  final homeController = Get.put(Deshboard_screen_Controller());
  final AboutusControllee1 = Get.put(AboutusController());
  final ProfilePageController1 = Get.put(ProfilePageController());
  final Logout_controller1 = Get.put(Logout_controller());


  late FirebaseMessaging messaging;


  @override
  void onInit() {
    super.onInit();

    hideNavBar = false;
    homeController.onInit();
    AboutusControllee1.onInit();
    ProfilePageController1.onInit();
    Logout_controller1.onInit();

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
/*
      FirebaseMessaging.instance.getInitialMessage().then((message) {
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
    AboutusControllee1.onClose();
    ProfilePageController1.onClose();
    Logout_controller1.onClose();

  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Add"),
        activeColorPrimary: Colors.blueAccent,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
        /* routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: {
              '/first': (context) => MainScreen2(),
              '/second': (context) => MainScreen3(),
            },
          ),
          onPressed: (context) {
            pushDynamicScreen(context,
                screen: SampleModalScreen(), withNavBar: true);
          }*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: ("Messages"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.grey,
        /* routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.grey,
        /*routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),*/
      ),
    ];

    void increment() => count.value++;
  }
}
