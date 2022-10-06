

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'dart:async';

import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';

class Payment_due_view extends StatelessWidget {
  const Payment_due_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSubTITLE( "13/07/2022", onTap,context ),

      body: ListView(
        children: [
           Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
            child: TextFieldShow(
              text: "Payment Due",
              height: 1,
              color: ColorValues.info_text_color,
              fontsize: 24,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),

          ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),

            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 7),
                child: ExpansionTileCard(
                  baseColor: ColorValues.red_color,
                  expandedColor: ColorValues.BLACK,
                  trailing: const SizedBox(),
                  // key: controller.cardA,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      TextFieldShow(
                        text: "2m Leopold",
                        color: Colors.white,
                        fontsize: 14  ,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),

                      TextFieldShow(
                        text: "#8422",
                        color: Colors.white,
                        fontsize: 10  ,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w300,

                      ),
                    ],
                  ),

                  subtitle:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      TextFieldShow(
                        text: "49 Pienza Way",
                        color: Colors.white,
                        fontsize: 8  ,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),

                      TextFieldShow(
                        text: "290",
                        color: Colors.white,
                        fontsize: 18  ,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),

                    ],
                  ),

                  children:[
                    Container(
                      padding: EdgeInsets.only(left: 13,right: 45),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor:ColorValues.green_color,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5,top: 5),
                                child: TextFieldShow(
                                  text: "Delivered ",
                                  color:ColorValues.green_color,
                                  fontsize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              GestureDetector(
                                  onTap: (){
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Container(
                                                  height: 385,
                                                  width:374,
                                                  child: Image.asset("assets/Images/carton.png"),
                                                ),
                                              ),
                                            ],

                                          ),

                                    );

                                  },
                                  child: const Icon(Icons.attach_file,size: 18,color: Colors.grey))
                            ],
                          ),

                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Image.asset("assets/Images/info.png",),
                              ),
                          ),


                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(0),

                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Image.network("https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg",
                          fit: BoxFit.fill,
                          height: 180,),
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ],
      ),


    );
  }

  onTap() {
    Get.toNamed(Routes.LOGIN);
  }


}
