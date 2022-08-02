import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Note : photo video app bar worked diffrently
AppBar appbar_one(String title) => AppBar(
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
              Get.back();
            },
            child: Container()
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lato',
            ),
          ),
          SizedBox(),
        ],
      ),
    );
