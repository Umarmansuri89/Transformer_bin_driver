import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appbarSubTITLE(String sub_title, Function onTap) =>
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
          GestureDetector(
              onTap: () {
                // Get.back();
              },
              child: Image.asset('assets/Images/Menu.png',height: 40,width: 40,)
          ),
         /* Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),*/


          Row(children: <Widget>[
            GestureDetector(
              onTap: () {
                onTap();
                //Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black12,
                size: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                onTap();
                print('ssssssssssssss');
              },
              child: Text(
                sub_title,
                style: TextStyle(color: Color(0xffF79534), fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                onTap();
                //Get.back();
              },
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black12,
                size: 16,
              ),
            ),
          ],)

        ],
      ),
    );
