import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../utils/ColorValues.dart';
import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("About Us"),
      body:
      Container(
        color: Color(0xffffffff),
        height: double.infinity,

        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            return
               SingleChildScrollView(
                child:
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 10,right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){

                                },
                                child:  const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox()
                                  // Icon(
                                  //   Icons.refresh,
                                  //   color: ColorValues.Lite_black,
                                  //   size: 24.0,
                                  //   semanticLabel: 'Text to announce in accessibility modes',
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextFieldShow(
                                  text: "Hello,",
                                  height: 1,
                                  color: ColorValues.info_text_color,
                                  fontsize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.25,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextFieldShow(
                                  text: "${controller.user_name.value}",
                                  height: 1,
                                  color: ColorValues.info_text_color,
                                  fontsize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.25,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.all(20),
                              //child: Image.asset("assets/Images/Small_carton.png",fit: BoxFit.cover,),
                              child:   SvgPicture.asset("assets/Images/Frame.svg")
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 140,left: 20,right: 20),
                      child:ListView.builder(
                        itemCount: controller.items.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 10,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding:  EdgeInsets.only(left: 10.0,right: 10,top: 20,bottom: 10),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextFieldShow(
                                          text: "Company Name :",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                        TextFieldShow(
                                          text: "${controller.items[index].company_name}",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                      ],
                                    )
                                ),
                                Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextFieldShow(
                                          text: "E-mail :",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                        TextFieldShow(
                                          text: "${controller.items[index].email}",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                      ],
                                    )
                                ),
                                Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextFieldShow(
                                          text: "Contact Number :",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                        TextFieldShow(
                                          text: "${controller.items[index].contact_number}",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                      ],
                                    )
                                ),
                                Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextFieldShow(
                                          text: "Address :",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                        TextFieldShow(
                                          text: "${controller.items[index].address}",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                      ],
                                    )
                                ),
                                Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextFieldShow(
                                          text: "Location :",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                        TextFieldShow(
                                          text: "${controller.items[index].location}",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )

              );
          }
        }),
      )

    );
  }
}
