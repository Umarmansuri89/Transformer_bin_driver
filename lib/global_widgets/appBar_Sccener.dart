import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/image_helper.dart';

AppBar appbar_Scner(String sub_title, Function onTap) =>
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
              child: Padding(padding: EdgeInsets.all(10),
                child: Image.asset(Side_drawer,height: 40,width: 40,),
              ),
            ),
            GestureDetector(
              onTap: () {
                //onTap();
                //Get.back();
              },
              child: Padding(padding: EdgeInsets.all(10),
                child: Image.asset(Scenner,height: 40,width: 40),
              ),
            ),

          ],),




          Row(children: <Widget>[
            GestureDetector(
              onTap: () {
                onTap();
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
                onTap();
                print('ssssssssssssss');

              },
              child: Text(
                sub_title,
                style: TextStyle(color: Color(0xffF79534), fontSize: 20),
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
                size: 20,
              ),
            ),
          ],)



        ],
      ),
    );
