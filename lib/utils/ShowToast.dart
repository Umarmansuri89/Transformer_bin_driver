import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastClass{
  static const String colorwhite  = '#ffffff';

 static showToast(String msg) {
   Fluttertoast.showToast(msg: msg,
       toastLength: Toast.LENGTH_LONG,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.black26,
       textColor: Colors.white,
       fontSize: 15.0,
   );
 }

}