import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transformer_bin_driver/utils/ColorValues.dart';
import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../global_widgets/textfield_ui.dart';
import '../../../utils/image_helper.dart';

import '../../Deshboard/textfield.dart';
import '../controllers/profile_page_controller.dart';


class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {


   final controller = Get.find<ProfilePageController>();
   String? profile="";




  @override
  Widget build(BuildContext context) {

   // print('======${controller.attachmentPath.value}');
    return Scaffold(
      appBar: appbar("Profile Settings"),
      body: Container(
        height: double.infinity,
        color: ColorValues.white,
        child: Obx(() {
    if (controller.isLoading.value) {
    return Center(child: CupertinoActivityIndicator());
    } else {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: SingleChildScrollView(
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
                              text: "${controller.name.text} ""${controller.lastname.text}",
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
                Padding(
                  padding: EdgeInsets.only(left: 05,right: 05,bottom: 05,top: 140),
                  child:  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child:
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset("assets/Images/profile.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 20),
                              child: TextFieldDesigned_one(
                                controller: controller.name,
                                maxLines: 2,
                                fontSize: 14,
                                maxLength: 50,
                                minLines: 1,
                                hintText: "First Name",
                                hintStyle: Color(0xffCCD2E3),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: false,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Color(0xffCCD2E3),
                                  size: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 20,bottom: 10),
                              child: TextFieldDesigned_one(
                                controller: controller.lastname,
                                maxLines: 2,
                                fontSize: 14,
                                maxLength: 50,
                                minLines: 1,
                                hintText: "Last Name",
                                hintStyle: Color(0xffCCD2E3),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: false,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Color(0xffCCD2E3),
                                  size: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFieldDesigned_one(
                                controller: controller.email,
                                maxLines: 2,
                                fontSize: 14,
                                maxLength: 50,
                                minLines: 1,
                                hintText: "E-mail",
                                hintStyle: Color(0xffCCD2E3),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xffCCD2E3),
                                  size: 16.0,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFieldDesigned_one(
                                controller: controller.mobile,
                                maxLines: 2,
                                fontSize: 14,
                                maxLength: 50,
                                minLines: 1,
                                hintText: "Mobile",
                                hintStyle: Color(0xffCCD2E3),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: false,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xffCCD2E3),
                                  size: 16.0,
                                ),
                              ),
                            ),


                            GestureDetector(
                              onTap: ()=>{
                                controller.Update_profile()
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF79534),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: 50,
                                  child: TextFieldShow(
                                    height: 2,
                                    textAlign: TextAlign.center,
                                    text: "Submit",
                                    fontsize: 18.0,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),

                      )


                  ),
                )
              ],
            )



          ),

        );
        }}),
      ),

    );

  }
}



