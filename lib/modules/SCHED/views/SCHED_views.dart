import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../global_widgets/appBar_Sccener.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';

class SCHED_view extends StatelessWidget {
  SCHED_view({Key? key}) : super(key: key);
  List color=[
    ColorValues.rv_hookup_coller,
    ColorValues.rv_hookup_coller,
    ColorValues.rv_hookup_coller,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar_Scner("12/12/2022", onTap),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, top: 37, bottom: 25),
            child:  TextFieldShow(
              height: 01,
              text: "Schedule",
              color: Color(0xFF333333),
              fontsize: 23,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5,
                  child: Container(
                      child: Image.asset("assets/Images/Sched_map.png", fit: BoxFit.fill)),),
                Expanded(flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height:  MediaQuery.of(context).size.height,
                    color: ColorValues.Sched_backgroung_COLOR,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldShow(
                            height: 2,
                            text: "Ballarat Driver",
                            color: ColorValues.text_coller,
                            fontsize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 3),
                                  alignment: Alignment.topLeft,
                                  child: Icon(Icons.rv_hookup, color: ColorValues.rv_hookup_coller,size: 12,)),
                              SizedBox(width: 3),
                              TextFieldShow(
                                height: 2,
                                text: "RUN 1",
                                color: ColorValues.text_coller,
                                fontsize: 7,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "2m Leopold",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFieldShow(
                            height: 2,
                            text: "Gelong Driver",
                            color: ColorValues.text_coller,
                            fontsize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 4),
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.blue_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "10m Donnelly",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "4m Collins St.",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFieldShow(
                            height: 2,
                            text: "Not Assigned",
                            color: ColorValues.text_coller,
                            fontsize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "4m Collins St.",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.lightblue_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "8m Donnelly",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.blue_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "2m Leopold",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "2m Leopold",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "2m Collins St.",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.blue_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "10m Donnelly",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "4m Collins St.",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.lightblue_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "8m Donnelly",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.blue_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "2m Leopold",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.centerLeft,
                            height: 28,
                            width: 141,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorValues.green_background,
                            ),

                            child: TextFieldShow(
                              height: 0,
                              text: "2m Leopold",
                              color: ColorValues.White,
                              fontsize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                        ],

                      ),
                    ),
                  ),)
              ],
            ),
          )

        ],
      ),

    );
  }
}

onTap() {
  Get.toNamed(Routes.LOGIN);
}
