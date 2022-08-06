import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transformer_bin_driver/utils/ColorValues.dart';

class CustomAlertDialog extends StatelessWidget {
  final String image;
  final double? fontSize;
  final double imagehight;
  final double imagewidth;

  final Color bgColor;
  final String? title;
  final String? title1;
  final String? message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final double circularBorderRadius;

  CustomAlertDialog({
    this.fontSize,
    required this.image,
    required this.imagehight,
    required this.imagewidth,
    this.title,
    this.title1,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 10),
      content:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(image,height: imagehight,width: imagewidth,),
          Container(
              decoration: BoxDecoration(
                color: const Color(0xffF79534),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
              Padding(
                padding: EdgeInsets.all(05),
                child: title != null ? Text(title!,style: TextStyle(color: ColorValues.white,fontSize: fontSize),) : null,
              )
          ),
          Container(
              decoration: BoxDecoration(
                color: const Color(0xffF79534),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
              Padding(
                padding: EdgeInsets.all(05),
                child: title1 != null ? Text(title1!,style: TextStyle(color: ColorValues.white,fontSize: fontSize),) : null,
              )

          )


        ],),

      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        if (negativeBtnText != null)
          TextButton(
            child: Text(negativeBtnText!),
            onPressed: () => Get.back(result: false),
          ),
        if (positiveBtnText != null)
          TextButton(
            child: Text(positiveBtnText!),
            onPressed: () => Get.back(result: true),
          ),
      ],
    );
  }
}
