

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/custom_alert_dialog.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../utils/ColorValues.dart';
import '../../../utils/image_helper.dart';
import '../controllers/Schedule_controller.dart';

class Schedule_View extends StatelessWidget {

  Schedule_controller controller = Get.put(Schedule_controller());


   List color=[
     ColorValues.dashbboard_card_back_colorrr,
     ColorValues.dashbboard_card_back_colorr,
     ColorValues.dashbboard_card_back_colorrrr,
   ];



   Color _textColor = Colors.white;
   bool Hide_leading = false;
   @override
   Widget build(BuildContext context) {
     for(int i=0;i<10;i++){
       controller.Colorlist.add(0xFFffffff);
       controller.Hide_leading.add(false);
     }
     final ButtonStyle flatButtonStyle = TextButton.styleFrom(
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(4.0)),
       ),
     );
     // controller.selectDatedialog(context);
     return Scaffold(
         backgroundColor: Colors.white,
         // appBar: appbarSubTITLE(controller.currentDate.toString(), onTap),
         appBar: appbarSubTITLE( "13/07/2022", onTap ),
         body:

         Container(
           //height: MediaQuery.of(context).size.height,
           child: Obx(() {
             if (controller.isLoading.value) {
               return const Center(
                   child: CupertinoActivityIndicator()
               );
             }
             else {
               return
                 ListView(
                   shrinkWrap: true,
                   children: <Widget>[
                     Stack(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Padding(
                                     padding: EdgeInsets.all(10),
                                     child: Icon(
                                       Icons.refresh,
                                       color: ColorValues.Lite_black,
                                       size: 24.0,
                                       semanticLabel: 'Text to announce in accessibility modes',
                                     ),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(left: 10.0),
                                     child: TextFieldShow(
                                       text: "Heloo Driver #212",
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
                                 child: Image.asset("assets/Images/Small_carton.png",fit: BoxFit.cover,),
                               ),
                             ],


                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 140,left: 20,right: 20),
                           child: Card(
                               semanticContainer: true,
                               clipBehavior: Clip.antiAlias,
                               margin: const EdgeInsets.all(5),
                               color: ColorValues.dashbboard_card_back_color,
                               elevation: 10,
                               child: Container(
                                 margin: const EdgeInsets.only( top: 10, left: 5, right: 5,bottom: 5),
                                 child: Column(
                                   mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: <Widget>[
                                     Row(
                                       mainAxisSize: MainAxisSize.max,
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: <Widget>[
                                         Container(
                                           margin:  EdgeInsets.all(10),
                                           child:  TextFieldShow(
                                             text: "Tasks",
                                             height: 1,
                                             color: ColorValues.info_text_color,
                                             fontsize: 23,
                                             fontFamily: 'Lato',
                                             fontWeight: FontWeight.w700,
                                             letterSpacing: -0.31,

                                           ),
                                         ),
                                       ],),

                                     Container(
                                       child:  ListView.builder(
                                         itemCount: 10,
                                         shrinkWrap: true,
                                         physics:const NeverScrollableScrollPhysics(),
                                         itemBuilder: (BuildContext context, int index) {
                                           return Container(
                                             padding: const EdgeInsets.all(05),
                                             child: ExpansionTileCard(
                                               baseColor: ColorValues.Down_list,
                                               expandedColor: ColorValues.white,
                                               onExpansionChanged: (expanded) {
                                                // setState(() {
                                                   if (expanded) {
                                                     print("true");
                                                     controller.Hide_leading[index]=true;
                                                     /*_textColor = Colors.black;*/
                                                     controller.Colorlist[index]=0xFF2E2E2E;
                                                   } else {
                                                     controller.Hide_leading[index]=false;
                                                     /*_textColor = Colors.white;*/
                                                     controller.Colorlist[index]=0xFFffffff;
                                                   }
                                               //  });
                                               },
                                               trailing: SizedBox(

                                               ),
                                               leading: controller.Hide_leading[index]==false?
                                               Padding(padding: EdgeInsets.all(05),child: Image.asset("assets/Images/Down_Arrow.png",)):
                                               SizedBox(),
                                               // key: controller.cardKeyList[index],
                                               title: Padding(
                                                 padding: EdgeInsets.only(top: 10.0),
                                                 child:  Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: [
                                                     TextFieldShow(
                                                       text: "2m Leopold",
                                                       color: Color(controller.Colorlist[index]),
                                                       fontsize: 14,
                                                       fontFamily: 'Lato',
                                                       fontWeight: FontWeight.w600,
                                                     ),

                                                     TextFieldShow(
                                                       text: "#8422",
                                                       color: Color(controller.Colorlist[index]),
                                                       fontsize: 10  ,
                                                       fontFamily: 'Lato',
                                                       fontWeight: FontWeight.w300,
                                                     ),
                                                   ],
                                                 ),
                                               ),

                                               subtitle:  Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   TextFieldShow(
                                                     text: "49 Pienza Way",
                                                     color:  Color(controller.Colorlist[index]),
                                                     fontsize: 8  ,
                                                     fontFamily: 'Lato',
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                   Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                     children: <Widget>[

                                                       //manage status this icon

                                                       TextFieldShow(
                                                         text: "Unpaid ",
                                                         color: ColorValues.Lite_black,
                                                         fontsize: 13  ,
                                                         fontFamily: 'Lato',
                                                         fontWeight: FontWeight.w400,
                                                       ),

                                                       TextFieldShow(
                                                         text:  symbol+"290",
                                                         color: Color(controller.Colorlist[index]),
                                                         fontsize: 18,
                                                         fontFamily: 'Lato',
                                                         fontWeight: FontWeight.w400,
                                                       ),

                                                     ],
                                                   )

                                                 ],
                                               ),
                                               children:[

                                                 controller.static_Status_list[index]==0?
                                                 Container(
                                                   padding: EdgeInsets.only(left: 13,right: 45),
                                                   child:Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Row(
                                                         children: [
                                                           GestureDetector(
                                                             onTap:(){
                                                               showAlertDialog(context);
                                                             },
                                                             child: const CircleAvatar(
                                                               radius: 10,
                                                               backgroundColor:ColorValues.green_color,
                                                             ),
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
                                                               child: const Icon(Icons.attach_file,size: 18,color: Colors.grey)),


                                                           CircleAvatar(
                                                             radius: 10,
                                                             backgroundColor:ColorValues.Lite_black,
                                                           ),
                                                           Container(
                                                             margin: const EdgeInsets.only(left: 5,top: 5),
                                                             child: TextFieldShow(
                                                               text: "Mark off",
                                                               color:ColorValues.Lite_black,
                                                               fontsize: 13,
                                                               fontWeight: FontWeight.w700,
                                                             ),
                                                           ),
                                                         ],
                                                       ),

                                                       GestureDetector(

                                                         onTap: (){
                                                           controller.onInfo();
                                                         },

                                                         child: Container(
                                                           padding: EdgeInsets.only(bottom: 2),
                                                           child: Image.asset("assets/Images/info.png",),
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                 ):
                                                 Container(
                                                   padding: EdgeInsets.only(left: 13,right: 45),
                                                   child:Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Row(
                                                         children: [
                                                           GestureDetector(
                                                             onTap:(){
                                                               showAlertDialog(context);
                                                             },
                                                             child: const CircleAvatar(
                                                               radius: 10,
                                                               backgroundColor:ColorValues.green_color,
                                                             ),
                                                           ),

                                                           Container(
                                                             margin: const EdgeInsets.only(left: 5,top: 5),
                                                             child: TextFieldShow(
                                                               text: "Not Picked up ",
                                                               color:ColorValues.green_color,
                                                               fontsize: 13,
                                                               fontWeight: FontWeight.w700,
                                                             ),
                                                           ),
                                                         ],
                                                       ),

                                                       GestureDetector(

                                                         onTap: (){

                                                           controller.onJobtype();

                                                         },

                                                         child: Container(
                                                           padding: EdgeInsets.only(bottom: 2),
                                                           child: Image.asset("assets/Images/info.png",),
                                                         ),
                                                       )
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
                                     )
                                   ],),
                               )
                           ),
                         ),


                       ],
                     )
                   ],)
               ;

             }
           }),
         )



     );
   }

   void showAlertDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return CustomAlertDialog(
           imagehight: 40.0,
           imagewidth: 40.0,
           image: add_a_photo,
           title: "TAKE A PHOTO",
           title1: "UPLOAD A FILE",
           fontSize:11,
         );
       },
     );
   }

   void onTap(ctx) {

     showCupertinoModalPopup(
         context: ctx,
         builder: (_) => Container(
           height: 190,
           color: const Color.fromARGB(255, 255, 255, 255),
           child: Column(
             children: [
               SizedBox(
                 height: 180,
                 child: CupertinoDatePicker(
                     initialDateTime: DateTime.now(),
                     onDateTimeChanged: (val) {
                       controller.dateSelected.value = val.toString();
                     }),
               ),

             ],
           ),
         ));
   }

}
