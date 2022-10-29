import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:transformer_bin_driver/modules/Logout/views/Logout_view.dart';
import 'package:transformer_bin_driver/modules/aboutus/views/aboutus_view.dart';
import 'package:transformer_bin_driver/modules/profile_page/views/profile_page_view.dart';
import 'package:transformer_bin_driver/utils/ColorValues.dart';


import '../../../utils/api_service.dart';
import '../../../utils/image_helper.dart';
import '../../Deshboard/views/Dashboard_screen_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final _currentIndex = 0.obs;


  /*Home
  My Profile
  About us
  Logout*/

  Future<bool> pop() async {
    Navigator.pop(ApiService.context);
    return true;
  }




  Future<bool?> _onBackPressed(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return
            AlertDialog(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              backgroundColor: Colors.orange,
              title:
              Padding(padding: EdgeInsets.only(top: 20),child:  Center(
                child:
                Text(
                  'Do You Want To Exit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lato',
                  ),
                ),

                //Text('Do you want to exit ',),
              ),),


              content:
              Text(''),
              actionsAlignment: MainAxisAlignment.spaceEvenly,

              actions: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    child: Text(
                      'NO',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),),
                Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    child: Text(
                      'YES',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      SystemNavigator.pop();
                    },
                  ),
                ),),
              ],
            );
        });
  }
  @override
  Widget build(BuildContext context) {
      //ApiService.context = context;
    return  WillPopScope(
      child:Obx(() => Scaffold(
        backgroundColor: ColorValues.background_divider_color,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: BottomNavigationBar(
              //showUnselectedLabels: false,
              currentIndex: _currentIndex.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: ColorValues.background_divider_color,
              unselectedItemColor: ColorValues.Lite_black,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              onTap: (value) {
                _currentIndex.value = value;
                // Respond to item press.
              },
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "My Profile",
                  icon: Icon(Icons.person),
                ),

                BottomNavigationBarItem(
                  label: "Contact us",
                  icon: Icon(Icons.contact_support),
                ),
                BottomNavigationBarItem(
                  label: "Logout",
                  icon: Icon(Icons.logout_outlined),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Obx(() => SizedBox(
              height: controller.count.value.toDouble(),
            )),
            buildScreens[_currentIndex.value]
          ],
        ),
      )),
      onWillPop: () async {
        bool? result= await _onBackPressed(context);
        if(result == null){
          result = false;
        }
        return result;
      },

    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
        ),
      ],
      title: Center(
        child: const Image(
          image: AssetImage(LOGO_IMAGE_BLACK),
          width: 100,
          height: 50,
        ),
      ),
    );
  }

  List buildScreens = <Widget>[
    Screen1(),
    Screen2(),
    Screen4(),
    Screen5(),
  ].obs;
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      contentPadding: 5,
      title: "\n Home",
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: ColorValues.background_divider_color,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 5,
      icon: Icon(Icons.person),
      title: ("My Profile"),
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: ColorValues.background_divider_color,
      inactiveColorPrimary: Colors.grey,
    ),

    PersistentBottomNavBarItem(
      icon: Icon(Icons.details),
      contentPadding: 5,
      title: ("Contact us"),
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: ColorValues.background_divider_color,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.logout_outlined),
      contentPadding: 5,
      title: ("Logout"),
      textStyle: const TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: ColorValues.background_divider_color,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}

Widget Screen1() {
  return Dashboard_screen_View();
}

Widget Screen2() {
  return ProfilePageView();
}

Widget Screen4() {
  return AboutusView();
}

Widget Screen5() {
  return Logout_View();
}
