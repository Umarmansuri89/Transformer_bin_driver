import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/custom_alert_dialog.dart';
import '../../../global_widgets/dropdownDesing.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';
import '../../../utils/image_helper.dart';
import '../controllers/Dashboard_screen_controller.dart';

class Dashboard_screen_View extends StatefulWidget {
  const Dashboard_screen_View({Key? key}) : super(key: key);

  @override
  State<Dashboard_screen_View> createState() => _Dashboard_screen_ViewState();
}

class _Dashboard_screen_ViewState extends State<Dashboard_screen_View> {


  List color=[
    ColorValues.dashbboard_card_back_colorrr,
    ColorValues.dashbboard_card_back_colorr,
    ColorValues.dashbboard_card_back_colorrrr,
  ];



  Color _textColor = Colors.white;
  bool Hide_leading = false;
  Deshboard_screen_Controller controller = Get.put(Deshboard_screen_Controller());
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
    return
      Obx(() {
       return Scaffold(
            backgroundColor: Colors.white,
            // appBar: appbarSubTITLE(controller.currentDate.toString(), onTap),
            appBar: appbarSubTITLE(controller.dob.toString(), onTap1, context),
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
                        controller.IsVisible==true?
                            Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      // padding: EdgeInsets.all(2),
                                      height: 40,
                                      width: 120,
                                      child:  DropdownButtonFormField2(
                                        decoration: InputDecoration(
                                          //Add isDense true and zero Padding.
                                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          //Add more decoration as you want here
                                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                        ),
                                        isExpanded: true,
                                        hint: const Text(
                                          'Month',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 60,
                                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        items: controller.genderItems
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select gender.';
                                          }
                                        },
                                        onChanged: (value) {
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {
                                          controller.selectedValue.value = value.toString();
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 100,
                                      child:  DropdownButtonFormField2(
                                        decoration: InputDecoration(
                                          //Add isDense true and zero Padding.
                                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          //Add more decoration as you want here
                                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                        ),
                                        isExpanded: true,
                                        hint: const Text(
                                          'Day',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 60,
                                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        items: controller.genderItems
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select gender.';
                                          }
                                        },
                                        onChanged: (value) {
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {
                                          controller.selectedValue.value = value.toString();
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 100,
                                      child:  DropdownButtonFormField2(
                                        decoration: InputDecoration(
                                          //Add isDense true and zero Padding.
                                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          //Add more decoration as you want here
                                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                        ),
                                        isExpanded: true,
                                        hint: const Text(
                                          'Year',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 60,
                                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        items: controller.genderItems
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select gender.';
                                          }
                                        },
                                        onChanged: (value) {
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {
                                          controller.selectedValue.value = value.toString();
                                        },
                                      ),
                                    ),
                                  ],),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        controller.IsVisible(false);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xff000000),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          // padding: EdgeInsets.all(2),
                                          height: 30,
                                          width: 100,
                                          child:
                                          Center(
                                            child:  TextFieldShow(
                                              text: "Save",
                                              height: 1.5,
                                              color: ColorValues.white,
                                              fontsize: 16,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.31,

                                            ),
                                          )

                                      ),
                                    )

                                  ],),
                              )
                            ],)
                       :
                            SizedBox(),
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
                                                padding: const EdgeInsets.all(02),
                                                child: ExpansionTileCard(
                                                  initialElevation: 0.0,
                                                  baseColor: ColorValues.Down_list,
                                                  expandedColor: ColorValues.white,
                                                  onExpansionChanged: (expanded) {
                                                    setState(() {
                                                      if (expanded) {
                                                        print("true");
                                                        controller.Hide_leading[index]=true;
                                                        /*_textColor = Colors.black;*/
                                                        controller.Colorlist[index]=0xFF2E2E2E;
                                                      } else {
                                                        print("false");
                                                        controller.Hide_leading[index]=false;
                                                        /*_textColor = Colors.white;*/
                                                        controller.Colorlist[index]=0xFFffffff;
                                                      }
                                                    });
                                                  },
                                                  trailing: SizedBox(),
                                                  leading:
                                                  controller.Hide_leading[index]==false?
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
                                                          fontsize: 10,
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[

                                                          //manage status this icon
//cross_doller
                                                          controller.Hide_leading[index]==true?
                                                          TextFieldShow(
                                                            text: "Unpaid ",
                                                            color: ColorValues.Lite_black,
                                                            fontsize: 13  ,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ):

                                                          Padding(
                                                            padding: EdgeInsets.only(right: 05),
                                                            child: Image.asset("assets/Images/cross_doller.png",fit: BoxFit.fill,height: 16,width: 16,),
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
                                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                  width: 374,
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
      });

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

    onTap1(context) {
   controller.selectDatedialog(context);
   }

}

onSubmit() {
  Get.toNamed(Routes.LOGIN);
}

