import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/custom_alert_dialog.dart';
import '../../../global_widgets/google_mep_place.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';
import '../../../utils/image_helper.dart';
import '../controllers/Dashboard_screen_controller.dart';
import '../textfield.dart';

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
      WillPopScope(
        child: Obx(() {
          return Scaffold(
              backgroundColor: Colors.white,
              // appBar: appbarSubTITLE(controller.currentDate.toString(), onTap),
              appBar: appbarSubTITLE(controller.dob.toString(), onTap1, context,true),
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
                                    width: 200,
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
                                      items: controller.Month
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
                                          return 'Please select month';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.Select_munth.value = value.toString();
                                        //Do something when changing the item if you want.
                                      },
                                      onSaved: (value) {
                                        controller.Select_munth.value = value.toString();
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 80,
                                    child:
                                    TextFieldDesigned_one(
                                      controller: controller.dayController,
                                      maxLines: 2,
                                      fontSize: 10,
                                      maxLength: 2,
                                      minLines: 1,
                                      hintText: "Day",
                                      hintStyle: const Color(0xffCCD2E3),
                                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                                      readOnly: false,
                                      keyboardType: TextInputType.number,
                                    ),


                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("========year");
                                      controller.yearpiker(context);
                                    },
                                    child:  Container(
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
                                        icon:

                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 60,
                                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        items: controller.YearList.value
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item.year.toString(),
                                              child: Text(
                                                item.year.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select Year';
                                          }
                                        },
                                        onChanged: (value) {
                                          controller.Select_year.value = value.toString();
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {
                                          controller.Select_year.value = value.toString();
                                        },
                                      ),
                                    ),
                                  )
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
                                      if(controller.Month.isEmpty){

                                        Get.snackbar("Please Select Month",'',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Color(0xffec9e29),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5
                                          ),
                                          barBlur: 0,
                                          colorText: Colors.white,
                                          maxWidth: double.infinity,
                                          snackStyle: SnackStyle.GROUNDED,
                                          borderRadius: 10,);

                                      }else if(controller.dayController.text.isEmpty){


                                        Get.snackbar("Please Fill Day",'',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Color(0xffec9e29),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5
                                          ),
                                          barBlur: 0,
                                          colorText: Colors.white,
                                          maxWidth: double.infinity,
                                          snackStyle: SnackStyle.GROUNDED,
                                          borderRadius: 10,);

                                      }else if(controller.Select_year.isEmpty){

                                        Get.snackbar("Please Select Year",'',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Color(0xffec9e29),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5
                                          ),
                                          barBlur: 0,
                                          colorText: Colors.white,
                                          maxWidth: double.infinity,
                                          snackStyle: SnackStyle.GROUNDED,
                                          borderRadius: 10,);

                                      }else{

                                        controller.formattedDate_one=controller.Select_year.value+"-"+controller.Select_munth.value+"-"+controller.dayController.text;
                                        print(controller.formattedDate_one);
                                        controller.My_jobs();

                                      }

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
                                        GestureDetector(
                                          onTap: (){
                                            controller.Todaydate();
                                            controller.My_jobs();
                                          },
                                          child:  const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.refresh,
                                              color: ColorValues.Lite_black,
                                              size: 24.0,
                                              semanticLabel: 'Text to announce in accessibility modes',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: TextFieldShow(
                                            text: "Hello, Driver #${controller.DriverID.value}",
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
                                                child: TextFieldShow(
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

                                          controller.items.isNotEmpty?
                                          Container(
                                            child:ListView.builder(
                                              key: Key('builder ${controller.select.toString()}'),
                                              itemCount: controller.items.length,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (BuildContext context, int index) {
                                                if(controller.items[index].delivery_status=="0"){
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      isThreeLine: false,
                                                      initiallyExpanded: index==controller.select,
                                                      initialElevation: 0.0,
                                                      baseColor: ColorValues.Down_list,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            // controller.select=index;
                                                            print("true");
                                                            //controller.endLocation=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            print("====${LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude))}");
                                                            setState(() {

                                                            });
                                                            //controller.google(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                          } else {
                                                            // controller.select= -1;
                                                            print("false");

                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }

                                                          if (expanded) {
                                                            setState(() {});
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.Hide_leading[index]=true;
                                                            controller.select=index;
                                                          }else {
                                                            setState(() {});
                                                            controller.Colorlist[index]=0xFFffffff;
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),

                                                      leading: Padding(
                                                          padding: EdgeInsets.all(05),
                                                          child: SvgPicture.asset("assets/Images/drop.svg")
                                                      ),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
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
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )

                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),

                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 10,right: 40),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              Expanded(
                                                                flex: 1,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [


                                                                    GestureDetector(
                                                                      onTap: (){
                                                                        controller.Delivery_status.value="3";
                                                                        controller.bin_id.value=controller.items[index].id;
                                                                        showAlertDialog(context);
                                                                      },
                                                                      child:  Row(children: [
                                                                        const Padding(
                                                                          padding: EdgeInsets.only(left: 00),
                                                                          child: CircleAvatar(
                                                                            radius: 10,
                                                                            backgroundColor:ColorValues.Lite_black,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets.only(left: 5,top: 8),
                                                                          child: TextFieldShow(
                                                                            text: "Delivered",
                                                                            color:ColorValues.Lite_black,
                                                                            fontsize: 13,
                                                                            fontWeight: FontWeight.w700,
                                                                          ),
                                                                        ),
                                                                      ],),
                                                                    ),

                                                                    GestureDetector(
                                                                      onTap: (){
                                                                        controller.Delivery_status.value="6";
                                                                        controller.bin_id.value=controller.items[index].id;
                                                                        MerkOff_popup(context);
                                                                      },
                                                                      child:  Row(
                                                                        children: [
                                                                          const Padding(
                                                                            padding: EdgeInsets.only(left: 10),
                                                                            child: CircleAvatar(
                                                                              radius: 10,
                                                                              backgroundColor:ColorValues.Lite_black,
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            margin: const EdgeInsets.only(left: 5,top: 8),
                                                                            child: TextFieldShow(
                                                                              text: "Mark off",
                                                                              color:ColorValues.Lite_black,
                                                                              fontsize: 13,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                        color: const Color(
                                                                            0xfffffff),
                                                                        borderRadius: BorderRadius.circular(20),
                                                                      ),
                                                                      // padding: EdgeInsets.all(2),
                                                                      height: 20,
                                                                      width: 100,
                                                                      child:  DropdownButtonFormField2(
                                                                        //focusColor: Colors.black,
                                                                        decoration: InputDecoration(

                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(20),
                                                                            borderSide: BorderSide(color: Colors.black, width: 1),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(20),
                                                                            borderSide: BorderSide(color: Colors.black, width: 1),
                                                                          ),
                                                                          focusColor: Colors.black,
                                                                          fillColor: Colors.black,
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
                                                                          'Status',
                                                                          style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                                        ),
                                                                        icon: const Icon(
                                                                          Icons.arrow_drop_down,
                                                                          color: Colors.black,
                                                                        ),
                                                                        iconSize: 20,
                                                                        buttonHeight: 60,
                                                                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                                        dropdownDecoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        items: controller.PaymentList.value
                                                                            .map((item) =>
                                                                            DropdownMenuItem<String>(
                                                                              value: item.name,
                                                                              child: Text(
                                                                                item.name,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 10,
                                                                                ),
                                                                              ),
                                                                            ))
                                                                            .toList(),
                                                                        validator: (value) {
                                                                          if (value == null) {
                                                                            return 'Payment';
                                                                          }
                                                                        },
                                                                        onChanged: (value) {
                                                                          controller.bin_payment_status.value = value.toString();
                                                                          print("bin_payment_status===============${ controller.bin_payment_status.value}");
                                                                          //Do something when changing the item if you want.
                                                                        },
                                                                        onSaved: (value) {
                                                                          //controller.selectedValue.value = value.toString();
                                                                        },
                                                                      ),
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 0,
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    var data={
                                                                      "job_id": controller.items[index].id,
                                                                      "user_id": controller.items[index].driver_id,
                                                                    };
                                                                    Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                  },
                                                                  child: Container(
                                                                    padding: EdgeInsets.only(bottom: 2),
                                                                    child:  SvgPicture.asset("assets/Images/info.svg",),
                                                                  ),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }else if(controller.items[index].delivery_status=="1"){
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      initialElevation: 0.0,
                                                      initiallyExpanded: index==controller.select,
                                                      baseColor: ColorValues.Down_list_pickup,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            print("true");
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                          } else {
                                                            print("false");
                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }

                                                          if (expanded) {
                                                            setState(() {
                                                            });
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.select=index;
                                                            controller.Hide_leading[index]=true;

                                                          }else {
                                                            setState(() {});
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),
                                                      leading:
                                                      Padding(padding: EdgeInsets.all(05),child: SvgPicture.asset("assets/Images/up.svg")),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
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
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )

                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),
                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 13,right: 45),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [

                                                              GestureDetector(
                                                                onTap: (){
                                                                  controller.Delivery_status.value="4";
                                                                  controller.bin_id.value=controller.items[index].id;
                                                                  showAlertDialog(context);
                                                                },
                                                                child: Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.Lite_black,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Pick Up",
                                                                      color:ColorValues.Lite_black,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],),
                                                              ),
                                                              GestureDetector(
                                                                onTap: (){
                                                                  controller.Delivery_status.value="6";
                                                                  controller.bin_id.value=controller.items[index].id;
                                                                  MerkOff_popup(context);
                                                                },
                                                                child:  Row(
                                                                  children: [
                                                                    const Padding(
                                                                      padding: EdgeInsets.only(left: 10),
                                                                      child: CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundColor:ColorValues.Lite_black,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets.only(left: 5,top: 8),
                                                                      child: TextFieldShow(
                                                                        text: "Mark off",
                                                                        color:ColorValues.Lite_black,
                                                                        fontsize: 13,
                                                                        fontWeight: FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xfffffff),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                // padding: EdgeInsets.all(2),
                                                                height: 20,
                                                                width: 100,
                                                                child:  DropdownButtonFormField2(
                                                                  //focusColor: Colors.black,
                                                                  decoration: InputDecoration(

                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusColor: Colors.black,
                                                                    fillColor: Colors.black,
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
                                                                    'Status',
                                                                    style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                                  ),
                                                                  icon: const Icon(
                                                                    Icons.arrow_drop_down,
                                                                    color: Colors.black,
                                                                  ),
                                                                  iconSize: 20,
                                                                  buttonHeight: 60,
                                                                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                                  dropdownDecoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  items: controller.PaymentList.value
                                                                      .map((item) =>
                                                                      DropdownMenuItem<String>(
                                                                        value: item.name,
                                                                        child: Text(
                                                                          item.name,
                                                                          style: const TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 10,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                      .toList(),
                                                                  validator: (value) {
                                                                    if (value == null) {
                                                                      return 'Payment';
                                                                    }
                                                                  },
                                                                  onChanged: (value) {
                                                                    controller.bin_payment_status.value = value.toString();
                                                                    //Do something when changing the item if you want.
                                                                  },
                                                                  onSaved: (value) {
                                                                  },
                                                                ),
                                                              ),

                                                              GestureDetector(
                                                                onTap: (){
                                                                  var data={
                                                                    "job_id": controller.items[index].id,
                                                                    "user_id": controller.items[index].driver_id,
                                                                  };
                                                                  Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.only(bottom: 2),
                                                                  child: SvgPicture.asset("assets/Images/info.svg",),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }else if(controller.items[index].delivery_status=="2"){
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      initialElevation: 0.0,
                                                      initiallyExpanded: index==controller.select,
                                                      baseColor: ColorValues.Down_list_exchange,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            print("true");
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));

                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                          } else {

                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            print("false");
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }
                                                          if (expanded) {
                                                            setState(() {
                                                            });
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.select=index;
                                                            controller.Hide_leading[index]=true;

                                                          }else {
                                                            setState(() {});
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),
                                                      leading:
                                                      Padding(padding: EdgeInsets.all(05),child: SvgPicture.asset("assets/Images/move_down.svg")),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 10,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      subtitle: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          TextFieldShow(
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )

                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),

                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 13,right: 45),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              GestureDetector(
                                                                onTap: (){
                                                                  controller.Delivery_status.value="5";
                                                                  controller.bin_id.value=controller.items[index].id;
                                                                  showAlertDialog(context);
                                                                },
                                                                child: Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.Lite_black,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Exchange",
                                                                      color:ColorValues.Lite_black,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],),
                                                              ),

                                                              GestureDetector(
                                                                onTap: (){
                                                                  controller.Delivery_status.value="6";
                                                                  controller.bin_id.value=controller.items[index].id;
                                                                  MerkOff_popup(context);
                                                                },
                                                                child:  Row(
                                                                  children: [
                                                                    const Padding(
                                                                      padding: EdgeInsets.only(left: 10),
                                                                      child: CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundColor:ColorValues.Lite_black,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets.only(left: 5,top: 8),
                                                                      child: TextFieldShow(
                                                                        text: "Mark off",
                                                                        color:ColorValues.Lite_black,
                                                                        fontsize: 13,
                                                                        fontWeight: FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xfffffff),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                // padding: EdgeInsets.all(2),
                                                                height: 20,
                                                                width: 100,
                                                                child:  DropdownButtonFormField2(
                                                                  //focusColor: Colors.black,
                                                                  decoration: InputDecoration(

                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusColor: Colors.black,
                                                                    fillColor: Colors.black,
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
                                                                    'Status',
                                                                    style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                                  ),
                                                                  icon: const Icon(
                                                                    Icons.arrow_drop_down,
                                                                    color: Colors.black,
                                                                  ),
                                                                  iconSize: 20,
                                                                  buttonHeight: 60,
                                                                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                                  dropdownDecoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  items: controller.PaymentList.value
                                                                      .map((item) =>
                                                                      DropdownMenuItem<String>(
                                                                        value: item.name,
                                                                        child: Text(
                                                                          item.name,
                                                                          style: const TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 10,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                      .toList(),
                                                                  validator: (value) {
                                                                    if (value == null) {
                                                                      return 'Payment';
                                                                    }
                                                                  },
                                                                  onChanged: (value) {
                                                                    controller.bin_payment_status.value = value.toString();

                                                                    //Do something when changing the item if you want.
                                                                  },
                                                                  onSaved: (value) {
                                                                    controller.selectedValue.value = value.toString();
                                                                  },
                                                                ),
                                                              ),

                                                              GestureDetector(
                                                                onTap: (){
                                                                  var data={
                                                                    "job_id": controller.items[index].id,
                                                                    "user_id": controller.items[index].driver_id,
                                                                  };
                                                                  Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.only(bottom: 2),
                                                                  child: SvgPicture.asset("assets/Images/info.svg",),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }else if(controller.items[index].delivery_status=="3"){
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      isThreeLine: false,
                                                      initiallyExpanded: index==controller.select,
                                                      initialElevation: 0.0,
                                                      baseColor: ColorValues.Down_list,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            // controller.select=index;
                                                            print("true");
                                                            //controller.endLocation=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            print("====${LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude))}");
                                                            setState(() {

                                                            });
                                                            //controller.google(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            // controller.Colorlist[index]=0xFF2E2E2E;
                                                          } else {
                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            // controller.select= -1;
                                                            print("false");
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }
                                                          if (expanded) {
                                                            setState(() {
                                                            });
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.Hide_leading[index]=true;
                                                            controller.select=index;
                                                          }else {
                                                            setState(() {});
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),
                                                      leading: Padding(padding: EdgeInsets.all(05),
                                                          child: SvgPicture.asset("assets/Images/drop.svg")),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
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
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )

                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),

                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 10,right: 40),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              Expanded(
                                                                flex: 1,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [


                                                                    Row(children: [
                                                                      const Padding(
                                                                        padding: EdgeInsets.only(left: 00),
                                                                        child: CircleAvatar(
                                                                          radius: 10,
                                                                          backgroundColor:ColorValues.green_color,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: const EdgeInsets.only(left: 5,top: 8),
                                                                        child: TextFieldShow(
                                                                          text: "Delivered !",
                                                                          color:ColorValues.green_color,
                                                                          fontsize: 13,
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ],),

                                                                    Row(
                                                                      children: [
                                                                        const Padding(
                                                                          padding: EdgeInsets.only(left: 10),
                                                                          child: CircleAvatar(
                                                                            radius: 10,
                                                                            backgroundColor:ColorValues.Lite_black,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets.only(left: 5,top: 8),
                                                                          child: TextFieldShow(
                                                                            text: "Mark off",
                                                                            color:ColorValues.Lite_black,
                                                                            fontsize: 13,
                                                                            fontWeight: FontWeight.w700,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),


                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                        color: const Color(
                                                                            0xfffffff),
                                                                        borderRadius: BorderRadius.circular(20),
                                                                      ),
                                                                      // padding: EdgeInsets.all(2),
                                                                      height: 20,
                                                                      width: 100,
                                                                      child:  DropdownButtonFormField2(
                                                                        //focusColor: Colors.black,
                                                                        decoration: InputDecoration(

                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(20),
                                                                            borderSide: BorderSide(color: Colors.black, width: 1),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(20),
                                                                            borderSide: BorderSide(color: Colors.black, width: 1),
                                                                          ),
                                                                          focusColor: Colors.black,
                                                                          fillColor: Colors.black,
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
                                                                          'Status',
                                                                          style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                                        ),
                                                                        icon: const Icon(
                                                                          Icons.arrow_drop_down,
                                                                          color: Colors.black,
                                                                        ),
                                                                        iconSize: 20,
                                                                        buttonHeight: 60,
                                                                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                                        dropdownDecoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        items: controller.PaymentList.value
                                                                            .map((item) =>
                                                                            DropdownMenuItem<String>(
                                                                              value: item.name,
                                                                              child: Text(
                                                                                item.name,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 10,
                                                                                ),
                                                                              ),
                                                                            ))
                                                                            .toList(),
                                                                        validator: (value) {
                                                                          if (value == null) {
                                                                            return 'Payment';
                                                                          }
                                                                        },
                                                                        onChanged: (value) {
                                                                          controller.bin_payment_status.value = value.toString();
                                                                          print("bin_payment_status===============${ controller.bin_payment_status.value}");
                                                                          //Do something when changing the item if you want.
                                                                        },
                                                                        onSaved: (value) {
                                                                          //controller.selectedValue.value = value.toString();
                                                                        },
                                                                      ),
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 0,
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    var data={
                                                                      "job_id": controller.items[index].id,
                                                                      "user_id": controller.items[index].driver_id,
                                                                    };
                                                                    Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                  },
                                                                  child: Container(
                                                                    padding: EdgeInsets.only(bottom: 2),
                                                                    child:  SvgPicture.asset("assets/Images/info.svg",),
                                                                  ),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }else if(controller.items[index].delivery_status=="4"){
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      initialElevation: 0.0,
                                                      initiallyExpanded: index==controller.select,
                                                      baseColor: ColorValues.Down_list_pickup,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            print("true");
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));
                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                          } else {
                                                            print("false");
                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }
                                                          if (expanded) {
                                                            setState(() {
                                                            });
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.select=index;
                                                            controller.Hide_leading[index]=true;

                                                          }else {
                                                            setState(() {});
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),
                                                      leading:
                                                      Padding(padding: EdgeInsets.all(05),child: SvgPicture.asset("assets/Images/up.svg")),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
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
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )

                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),
                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 13,right: 45),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [

                                                              Row(children: [
                                                                const Padding(
                                                                  padding: EdgeInsets.only(left: 00),
                                                                  child: CircleAvatar(
                                                                    radius: 10,
                                                                    backgroundColor:ColorValues.green_color,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: const EdgeInsets.only(left: 5,top: 8),
                                                                  child: TextFieldShow(
                                                                    text: "Pickuped!",
                                                                    color:ColorValues.green_color,
                                                                    fontsize: 13,
                                                                    fontWeight: FontWeight.w700,
                                                                  ),
                                                                ),
                                                              ],),

                                                              Row(
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 10),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.Lite_black,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Mark off",
                                                                      color:ColorValues.Lite_black,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xfffffff),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                // padding: EdgeInsets.all(2),
                                                                height: 20,
                                                                width: 100,
                                                                child:  DropdownButtonFormField2(
                                                                  //focusColor: Colors.black,
                                                                  decoration: InputDecoration(

                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusColor: Colors.black,
                                                                    fillColor: Colors.black,
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
                                                                    'Status',
                                                                    style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                                  ),
                                                                  icon: const Icon(
                                                                    Icons.arrow_drop_down,
                                                                    color: Colors.black,
                                                                  ),
                                                                  iconSize: 20,
                                                                  buttonHeight: 60,
                                                                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                                  dropdownDecoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  items: controller.PaymentList.value
                                                                      .map((item) =>
                                                                      DropdownMenuItem<String>(
                                                                        value: item.name,
                                                                        child: Text(
                                                                          item.name,
                                                                          style: const TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 10,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                      .toList(),
                                                                  validator: (value) {
                                                                    if (value == null) {
                                                                      return 'Payment';
                                                                    }
                                                                  },
                                                                  onChanged: (value) {
                                                                    controller.bin_payment_status.value = value.toString();
                                                                    //Do something when changing the item if you want.
                                                                  },
                                                                  onSaved: (value) {
                                                                  },
                                                                ),
                                                              ),

                                                              GestureDetector(
                                                                onTap: (){
                                                                  var data={
                                                                    "job_id": controller.items[index].id,
                                                                    "user_id": controller.items[index].driver_id,
                                                                  };
                                                                  Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.only(bottom: 2),
                                                                  child: SvgPicture.asset("assets/Images/info.svg",),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }else if(controller.items[index].delivery_status=="5"){
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      initialElevation: 0.0,
                                                      initiallyExpanded: index==controller.select,
                                                      baseColor: ColorValues.Down_list_exchange,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            print("true");
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));

                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                          } else {
                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            print("false");
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }
                                                          if (expanded) {
                                                            setState(() {
                                                            });
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.select=index;
                                                            controller.Hide_leading[index]=true;

                                                          }else {
                                                            setState(() {});
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),
                                                      leading:
                                                      Padding(padding: EdgeInsets.all(05),child: SvgPicture.asset("assets/Images/move_down.svg")),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 10,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      subtitle: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          TextFieldShow(
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )

                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),

                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 13,right: 45),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              Row(children: [
                                                                const Padding(
                                                                  padding: EdgeInsets.only(left: 00),
                                                                  child: CircleAvatar(
                                                                    radius: 10,
                                                                    backgroundColor:ColorValues.green_color,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: const EdgeInsets.only(left: 5,top: 8),
                                                                  child: TextFieldShow(
                                                                    text: "Exchanged!",
                                                                    color:ColorValues.green_color,
                                                                    fontsize: 13,
                                                                    fontWeight: FontWeight.w700,
                                                                  ),
                                                                ),
                                                              ],),

                                                              Row(
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 10),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.Lite_black,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Mark off",
                                                                      color:ColorValues.Lite_black,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xfffffff),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                // padding: EdgeInsets.all(2),
                                                                height: 20,
                                                                width: 100,
                                                                child:  DropdownButtonFormField2(
                                                                  //focusColor: Colors.black,
                                                                  decoration: InputDecoration(

                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                                    ),
                                                                    focusColor: Colors.black,
                                                                    fillColor: Colors.black,
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
                                                                    'Status',
                                                                    style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                                  ),
                                                                  icon: const Icon(
                                                                    Icons.arrow_drop_down,
                                                                    color: Colors.black,
                                                                  ),
                                                                  iconSize: 20,
                                                                  buttonHeight: 60,
                                                                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                                  dropdownDecoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  items: controller.PaymentList.value
                                                                      .map((item) =>
                                                                      DropdownMenuItem<String>(
                                                                        value: item.name,
                                                                        child: Text(
                                                                          item.name,
                                                                          style: const TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 10,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                      .toList(),
                                                                  validator: (value) {
                                                                    if (value == null) {
                                                                      return 'Payment';
                                                                    }
                                                                  },
                                                                  onChanged: (value) {
                                                                    controller.bin_payment_status.value = value.toString();

                                                                    //Do something when changing the item if you want.
                                                                  },
                                                                  onSaved: (value) {
                                                                    controller.selectedValue.value = value.toString();
                                                                  },
                                                                ),
                                                              ),

                                                              GestureDetector(
                                                                onTap: (){
                                                                  var data={
                                                                    "job_id": controller.items[index].id,
                                                                    "user_id": controller.items[index].driver_id,
                                                                  };
                                                                  Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.only(bottom: 2),
                                                                  child: SvgPicture.asset("assets/Images/info.svg",),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    padding: const EdgeInsets.all(02),
                                                    child: ExpansionTileCard(
                                                      key: Key(index.toString()),
                                                      initialElevation: 0.0,
                                                      initiallyExpanded: index==controller.select,
                                                      baseColor: ColorValues.greyy_color,
                                                      expandedColor: ColorValues.white,
                                                      onExpansionChanged: (expanded) {
                                                        setState(() {
                                                          if (expanded) {
                                                            print("true");
                                                            controller.onAddMarkerButtonPressed(LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude)),controller.items[index].customer_address);
                                                            controller.lastMapPosition=LatLng(double.parse(controller.items[index].latitude),double.parse(controller.items[index].longitude));

                                                            // controller.Hide_leading[index]=true;
                                                            /*_textColor = Colors.black;*/
                                                            controller.Colorlist[index]=0xFFD9D9D9;
                                                          } else {
                                                            for(int i=0; i<controller.items.length; i++){
                                                              setState(() {});
                                                              controller.Colorlist[i]=0xFFffffff;
                                                              controller.Hide_leading[i]=false;
                                                            }
                                                            print("false");
                                                            // controller.Hide_leading[index]=false;
                                                            /*_textColor = Colors.white;*/
                                                            // controller.Colorlist[index]=0xFFffffff;
                                                          }

                                                          if (expanded) {
                                                            setState(() {
                                                            });
                                                            controller.Colorlist[index]=0xFF2E2E2E;
                                                            controller.select=index;
                                                            controller.Hide_leading[index]=true;

                                                          }else {
                                                            setState(() {});
                                                            controller.select = -1;
                                                          }
                                                        });
                                                      },
                                                      trailing: SizedBox(),
                                                      leading:
                                                      Padding(padding: EdgeInsets.all(05),child: SvgPicture.asset("assets/Images/drop.svg")),
                                                      // key: controller.cardKeyList[index],
                                                      title: Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextFieldShow(
                                                              text: "${controller.items[index].bin_name}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            TextFieldShow(
                                                              text: "#${controller.items[index].id}",
                                                              color: Color(controller.Colorlist[index]),
                                                              fontsize: 10,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      subtitle: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          TextFieldShow(
                                                            text: "${controller.items[index].bin_name}",
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
                                                              if(controller.Hide_leading[index]==false && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 2,right: 5),
                                                                    child:  Container(
                                                                        child:  SvgPicture.asset("assets/Images/new_cross.svg")
                                                                    ),
                                                                  )
                                                              )else if(controller.Hide_leading[index]==true && controller.items[index].payment_mode=="5")(
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 02,right: 02),
                                                                    child: TextFieldShow(
                                                                      height: 1.5,
                                                                      text: "Unpaid",
                                                                      color: ColorValues.Lite_black,
                                                                      fontsize: 13  ,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                              )else(
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 3,right: 5),
                                                                      child:  SvgPicture.asset("assets/Images/new_doller.svg")
                                                                  )
                                                              ),

                                                              TextFieldShow(
                                                                height: 1.2,
                                                                text:  symbol+"${controller.items[index].order_amount}",
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
                                                        Container(
                                                          padding: EdgeInsets.only(left: 13,right: 45),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              /* if(controller.items[index].delivery_status=="3")(
                                                                Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.green_color,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Delivered",
                                                                      color:ColorValues.green_color,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],)
                                                            )else if(controller.items[index].delivery_status=="4")(
                                                                Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.green_color,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Pickuped",
                                                                      color:ColorValues.green_color,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],)
                                                            )else if(controller.items[index].delivery_status=="5")(
                                                                Row(children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.green_color,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Exchanged",
                                                                      color:ColorValues.green_color,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],)
                                                            )else if(controller.items[index].delivery_status=="6")(
                                                                Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.red_color,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Reject delivery",
                                                                      color:ColorValues.red_color,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],)
                                                            )else if(controller.items[index].delivery_status=="7")(
                                                                Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.red_color,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Reject pickup",
                                                                      color:ColorValues.red_color,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],)
                                                            )else if(controller.items[index].delivery_status=="8")(
                                                                Row(children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(left: 00),
                                                                    child: CircleAvatar(
                                                                      radius: 10,
                                                                      backgroundColor:ColorValues.red_color,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(left: 5,top: 8),
                                                                    child: TextFieldShow(
                                                                      text: "Reject Exchange",
                                                                      color:ColorValues.red_color,
                                                                      fontsize: 13,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ],)
                                                            ),
*/

                                                              if(controller.items[index].delivery_status=="6")(
                                                                  Row(children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(left: 00),
                                                                      child: CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundColor:ColorValues.red_color,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets.only(left: 5,top: 8),
                                                                      child: TextFieldShow(
                                                                        text: "Mark off",
                                                                        color:ColorValues.red_color,
                                                                        fontsize: 13,
                                                                        fontWeight: FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],)
                                                              )else if(controller.items[index].delivery_status=="7")(
                                                                  Row(children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(left: 00),
                                                                      child: CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundColor:ColorValues.red_color,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets.only(left: 5,top: 8),
                                                                      child: TextFieldShow(
                                                                        text: "Mark off",
                                                                        color:ColorValues.red_color,
                                                                        fontsize: 13,
                                                                        fontWeight: FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],)
                                                              )else if(controller.items[index].delivery_status=="8")(
                                                                  Row(children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(left: 00),
                                                                      child: CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundColor:ColorValues.red_color,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets.only(left: 5,top: 8),
                                                                      child: TextFieldShow(
                                                                        text: "Mark off",
                                                                        color:ColorValues.red_color,
                                                                        fontsize: 13,
                                                                        fontWeight: FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],)
                                                              ),

                                                              /* Container(
                                                             decoration: BoxDecoration(
                                                               color: const Color(
                                                                   0xfffffff),
                                                               borderRadius: BorderRadius.circular(20),
                                                             ),
                                                             // padding: EdgeInsets.all(2),
                                                             height: 30,
                                                             width: 100,
                                                             child:  DropdownButtonFormField2(
                                                               //focusColor: Colors.black,
                                                               decoration: InputDecoration(

                                                                 enabledBorder: OutlineInputBorder(
                                                                   borderRadius: BorderRadius.circular(20),
                                                                   borderSide: BorderSide(color: Colors.black, width: 1),
                                                                 ),
                                                                 focusedBorder: OutlineInputBorder(
                                                                   borderRadius: BorderRadius.circular(20),
                                                                   borderSide: BorderSide(color: Colors.black, width: 1),
                                                                 ),
                                                                 focusColor: Colors.black,
                                                                 fillColor: Colors.black,
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
                                                                 'Status',
                                                                 style: TextStyle(fontSize: 10,color: ColorValues.BLACK),
                                                               ),
                                                               icon: const Icon(
                                                                 Icons.arrow_drop_down,
                                                                 color: Colors.black,
                                                               ),
                                                               iconSize: 30,
                                                               buttonHeight: 60,
                                                               buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                               dropdownDecoration: BoxDecoration(
                                                                 color: Colors.white,
                                                                 borderRadius: BorderRadius.circular(20),
                                                               ),
                                                               items: controller.PaymentList.value
                                                                   .map((item) =>
                                                                   DropdownMenuItem<String>(
                                                                     value: item.name,
                                                                     child: Text(
                                                                       item.name,
                                                                       style: const TextStyle(
                                                                         color: Colors.black,
                                                                         fontSize: 10,
                                                                       ),
                                                                     ),
                                                                   ))
                                                                   .toList(),
                                                               validator: (value) {
                                                                 if (value == null) {
                                                                   return 'Payment';
                                                                 }
                                                               },
                                                               onChanged: (value) {
                                                                 controller.bin_payment_status.value = value.toString();

                                                                 //Do something when changing the item if you want.
                                                               },
                                                               onSaved: (value) {
                                                                 controller.selectedValue.value = value.toString();
                                                               },
                                                             ),
                                                           ),*/

                                                              GestureDetector(
                                                                onTap: (){
                                                                  var data={
                                                                    "job_id": controller.items[index].id,
                                                                    "user_id": controller.items[index].driver_id,
                                                                  };
                                                                  Get.toNamed(Routes.JOBTYPE_LONG,parameters: data);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.only(bottom: 2),
                                                                  child: SvgPicture.asset("assets/Images/info.svg",),
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
                                                              child:
                                                              Stack(
                                                                alignment: Alignment.bottomLeft,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 180,
                                                                    width: double.infinity,
                                                                    child: Googlemep1(controller),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      print("========");
                                                                      var data={
                                                                        "let": controller.items[index].latitude,
                                                                        "long": controller.items[index].longitude,
                                                                        "address":controller.items[index].customer_address,
                                                                      };
                                                                      Get.toNamed(Routes.GOOGLE_MEP,parameters: data);
                                                                    },
                                                                    child:  Padding(
                                                                      padding: EdgeInsets.all(05),
                                                                      child: Container(
                                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                                                                        decoration: BoxDecoration(
                                                                          color: ColorValues.background_divider_color,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFieldShow(
                                                                          height: 1,
                                                                          text: "GET DIRECTIONS",
                                                                          color: Colors.white,
                                                                          fontsize: 12,
                                                                          fontFamily: 'Lato',
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ):
                                          Container(
                                            margin:  EdgeInsets.all(10),
                                            child: TextFieldShow(
                                              text: "No jobs allotted yet!",
                                              height: 2,
                                              color: ColorValues.info_text_color,
                                              fontsize: 23,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.31,
                                            ),
                                          ),
                                        ],),
                                    )
                                ),
                              ),
                            ],
                          )
                        ],);
                  }
                }),
              )

          );
        }),
        onWillPop: () async {
          bool? result= await _onBackPressed(context);
          if(result == null){
            result = false;
          }
          return result;
        },

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

  onTap1(context) {
    controller.selectDatedialog(context);
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

  Future<bool?> MerkOff_popup(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              backgroundColor: Colors.orange,
              title:
              Padding(padding: EdgeInsets.only(top: 20),child:  Center(
                child:
                Text(
                  'Are you sure to cancel this job?',
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
                      controller.Markoff();
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),),


              ],
            );
        });
  }
}

