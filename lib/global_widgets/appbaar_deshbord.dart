import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../utils/image_helper.dart';


// Note : photo video app bar worked diffrently
AppBar appbar_deshbord(String title) => AppBar(
  iconTheme: IconThemeData(
    size: 0,
    color: Colors.black, //change your color here
  ),
  elevation: 0,
  leadingWidth: 30,
  backgroundColor: Color(0xff0D0B21),
  automaticallyImplyLeading: false,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
         // Get.toNamed(Routes.DASHBOARD);
          Get.offAllNamed(Routes.DASHBOARD);
        },
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.white,
          size: 16,
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 20),
        child:       Image(image: AssetImage(SPLASH_LOGO_TEXT),height: 160,width: 100,),

      ),

      SizedBox(),
    ],
  ),
);
