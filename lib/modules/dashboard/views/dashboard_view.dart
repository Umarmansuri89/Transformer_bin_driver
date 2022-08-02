import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';



class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {


  final _currentIndex = 0.obs;
  final controller = Get.put(DashboardController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      //ApiService.context = context;
    return Scaffold(
      body:
      Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
                child: CupertinoActivityIndicator()
            );
          } else {
            return controller.screens[controller.currentIndex.value];
          }
        }),
      ),

      bottomNavigationBar: Container(
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Color(0xffF79534),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [0, 1, 2, 3]
              .map(
                (index) => InkWell(
              onTap: () {
             setState(() {

                  });
             controller.currentIndex.value = index;
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    //color: Color(0xffF79534),
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == controller.currentIndex.value ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == controller.currentIndex.value ? 4 : 0,
                    // decoration: BoxDecoration(
                    //   color: Color(0xff25307e),
                    // ),
                  ),
                  Icon(
                    index == controller.currentIndex.value
                        ? controller.listOfIconsBold[index]
                        : controller.listOfIconsLight[index],
                    size: size.width * .076,
                    color: index == controller.currentIndex.value
                        ? Color(0xffffffff)
                        : Color(0xffffffff),
                  ),
                  Text(
                    controller.listOfText[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: index == controller.currentIndex.value
                          ? Color(0xffffffff)
                          : Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
                 )
              .toList(),
        ),
      ),
    );

  }


}



