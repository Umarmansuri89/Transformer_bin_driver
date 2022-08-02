import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../global_widgets/Text_field_information.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../Controller/information_controller.dart';

class InformationView extends StatelessWidget {
   InformationView({Key? key}) : super(key: key);
   final _currentIndex = 0.obs;
  final controller = Get.put(Information_controler());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //ApiService.context = context;
    return Scaffold(
      appBar: appbarSubTITLE("12/12/2022", onTap),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                      ),
                      TextFieldShow(
                        text: "Delivered",
                        fontsize: 13.0,
                        fontWeight: FontWeight.w400,
                        color:  Colors.green,
                      ),
                      Icon(Icons.attach_file,size: 18,color: Colors.grey)
                    ],
                  ),
                  Icon(Icons.arrow_back_ios_new, color: Colors.red,)
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2m leopold",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.deepOrange,
                    ),
                    child: Text("UNPAID", style: TextStyle(color: Colors.white, fontSize: 12),),
                  )
                ],
              ),

            ),
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 10),
      child: Text("#8422", style: TextStyle(color: Colors.grey, fontSize: 10),),),

            Padding(padding:EdgeInsets.symmetric(
              vertical: 2, horizontal: 10),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.network("https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg",
              fit: BoxFit.fill,
              height: 180,),
            ),),
            Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
              child: Text("49 Pienza Way, Leopold", style: TextStyle(color: Colors.grey, fontSize: 12),),),
            Divider(color:Colors.deepOrange,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Waste Type", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("Skip Bin Heavy Waste", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Bin Size", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("2m", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Bine Taype", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("2m", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Scheduled", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("15/06/2022", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 10),
                    child: Text("Bine Price", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    child: Text("290.00 inc gst", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Qustanding", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("2900.0. ins gst", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Paymet Method", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("EFT", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 10),
                    child: Text("Customer", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    child: Text("John Lyng Group EBN \nJVA29219, J/n  221660012", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Company", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Phone", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10),
                    child: Text("EFT", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                    child: Text("Mobile", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10, bottom: 10),
                    child: Text("0401647343", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),

            Divider(color:Colors.deepOrange,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text("Notes", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,right: 10),
                      child: Icon(
                        Icons.phone_rounded, size: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,right: 10),
                      child: Icon(
                        Icons.message_sharp, size: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10),
              child: TextField_Note(

                controller: controller.note_Controller,

                // validator: (value) {
                //   if (value != null && !value.isEmail) {
                //     return 'Invalid Email ID.';
                //   }
                //   return null;
                // },

                maxLines: 7,
                fontSize: 14,
                maxLength: 50,
                minLines: 1,
                hintText: " ",
                hintStyle: Color(0xffCCD2E3),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                readOnly: false,
                keyboardType: TextInputType.text,

                // prefixIcon: Icon(
                //   Icons.email_outlined,
                //   color: Color(0xffCCD2E3),
                //   size: 16.0,
                // ),
              ),
            ),
            Row(
              children: [
                Container(

                  padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                  margin: EdgeInsets.only(left: 10, top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepOrange,
                  ),
                  child: Text("LOG NOTE",style: TextStyle(color: Colors.white, fontSize: 9),),
                )
              ],
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 10, bottom: 5),
                    child: Text("02/12/2022", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 10, bottom: 5),
                    child: Text("Lorem ipsum dolor sit", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                    child: Text("02/12/2022", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, right: 10, bottom: 10),
                    child: Text("Lorem ipsum dolor sit", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                )
              ],
            ),


          ],

        ),
      ),
    );

  }
}
onTap() {
  Get.toNamed(Routes.LOGIN);
}




// class InformationView extends StatefulWidget {




