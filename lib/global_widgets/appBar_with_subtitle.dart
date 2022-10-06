import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/Deliverd_and_uploaded/controllers/Dashboard_screen_controller.dart';

Deshboard_screen_Controller controller = Get.put(Deshboard_screen_Controller());

AppBar appbarSubTITLE(String sub_title,Function onTap,ctx) =>
    AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      elevation: 0,
      leadingWidth: 30,
      backgroundColor: Color(0xffffffff),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: <Widget>[
            GestureDetector(
              onTap: () {

                 //onTap();
                //Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black12,
                size: 20,
              ),
            ),
            GestureDetector(
              onTap: () {
               onTap(controller.selectDatedialog(ctx));
                print('ssssssssssssss');
              },
              child: Text(
                sub_title,
                style: TextStyle(color: Color(0xffF79534), fontSize: 20),
              ),
            ),
            GestureDetector(
              onTap: () {
              //  onTap();
                //Get.back();
              },
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black12,
                size: 20,
              ),
            ),
          ],),

          GestureDetector(
            onTap: () {
              if(controller.IsVisible.isFalse){

                controller.IsVisible(true);
              }else{

                controller.IsVisible(false);
              }

            },
            child: Image.asset("assets/Images/go_to_date.png",fit: BoxFit.fill,height: 30,width: 95,)
          ),
        ],
      ),
    );

