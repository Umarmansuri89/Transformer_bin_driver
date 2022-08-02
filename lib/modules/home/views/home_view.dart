import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../global_widgets/appBar_without_back_button.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/image_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../dashboard/local_widget/photo_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D0B21),
      appBar: appbar_one("Home"),
      body: Container(
        color: Color(0xff0D0B21),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFieldShow(
                        text: "Top Rated Girls",
                        color: Colors.white,
                        fontsize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: onAllSelect,
                      child: TextFieldShow(
                        text: "See all",
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900,
                        color: Color(0xffEC297B),
                        fontsize: 13,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Container(
                    height: 170,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: /*controller.girl_list.length*/ 2> 3
                          ? 3
                          : /*controller.girl_list.length,*/2,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 160,
                            width: 135,
                            color: Colors.transparent,
                            child: Obx(() => PhotoCard(
                                  height: 170,
                                  width: 120,
                                  img: "Images/news.png",
                                 /* img: controller.base_url.value +
                                      "/" +
                                      controller.girl_list[index].image,*/
                                  name: "umar",
                                )));
                      },
                      padding: EdgeInsets.all(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 20, bottom: 5),
                  child: TextFieldShow(
                    text: "Create Event",
                    color: Colors.white,
                    fontsize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: ontab,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color(0xff0D0B21),
                      border: Border.all(
                        color: Color(0xff312d5e),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 0,right: 0,top: 20,bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFieldShow(
                              text: "Create Event",
                              color: Colors.white,
                              fontsize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],),
                    ),
                  )
                ),
                Obx(
                  () => 5 > 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 20, bottom: 5),
                              child: TextFieldShow(
                                text: "FAQ's",
                                textAlign: TextAlign.start,
                                color: Colors.white,
                                fontsize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  child: ExpansionTile(
                                    collapsedBackgroundColor: Color(0xff211D4A),
                                    iconColor: Colors.white,
                                    collapsedIconColor: Colors.white,
                                    title: Text("what",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                        )),
                                    backgroundColor: Color(0xff211D4A),
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: ListTile(
                                            dense: true,
                                            title: Text(
                                              "abssss",
                                             // textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                color: Color(0xffE6E3FF),
                                                fontSize: 14,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            5 > 1
                                ? Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: Container(
                                        child: ExpansionTile(
                                          collapsedBackgroundColor:
                                              Color(0xff211D4A),
                                          iconColor: Colors.white,
                                          collapsedIconColor: Colors.white,
                                          title:
                                              Text("what",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                          backgroundColor: Color(0xff211D4A),
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: ListTile(
                                                  title: Text(
                                                "abc",
                                               // textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  height: 1.3,
                                                  color: Color(0xffE6E3FF),
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                               1 > 2
                                ? Padding(
                              padding:
                              const EdgeInsets.only(bottom: 10.0),
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  child: ExpansionTile(
                                    collapsedBackgroundColor:
                                    Color(0xff211D4A),
                                    iconColor: Colors.white,
                                    collapsedIconColor: Colors.white,
                                    title:
                                    Text("abc",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                        )),
                                    backgroundColor: Color(0xff211D4A),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5.0),
                                        child: ListTile(
                                            title: Text(
                                              "abc",
                                              // textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                height: 1.3,
                                                color: Color(0xffE6E3FF),
                                                fontSize: 14,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                : SizedBox(),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.FAQ_NEW_WITH_BACK_BUTTON);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 20),
                                child: Center(
                                  child: TextFieldShow(
                                    textAlign: TextAlign.center,
                                    text: "See All",
                                    fontFamily: 'Lato',
                                    color: Color(0xffEC297B),
                                    fontsize: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ontab() async {
    Get.toNamed(Routes.CITY_LIST);
  }

  void onAllSelect() async {
    Get.toNamed(Routes.TOP_RATED_GIRL);
  }
}
