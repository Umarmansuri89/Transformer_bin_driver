import 'package:flutter/material.dart';

class TextField_Note extends StatelessWidget {
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Color? hintStyle;
  final String hintText;
  final String initialValue;
  final int maxLength, minLines;
  final int maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? fillColorhere;

  late final String? counterText;

  TextField_Note({
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.hintStyle,
    this.initialValue = "",
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300,
    this.autovalidateMode,
    this.hintText = "",
    this.maxLines = 5,
    this.minLines = 1,
    this.maxLength = 300,
    this.validator,
    this.keyboardType = TextInputType.number,
    this.textAlign = TextAlign.start,
    this.counterText = "",
    this.fillColorhere,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130,
      width: MediaQuery.of(context).size.width-50,
      child: TextFormField(


        controller: controller,
        maxLines: 5,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),

          hintText: hintText,
          hintStyle: TextStyle(color: hintStyle,
              fontSize: fontSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          contentPadding: EdgeInsets.symmetric(vertical: 14,
              horizontal: 10),


          // suffixIcon: Container(
          //   alignment: Alignment.topRight,
          //    margin: EdgeInsets.only(bottom: 20,right: 10),
          //    // padding: EdgeInsets.only(bottom: 40.0),
          //   child:Icon(Icons.message,color: Colors.black,),
          //   width: 1.0,
          //   height: 1.0,
          // ),

          fillColor: Colors.white,
          filled: true,

        ),
      )



      // TextFormField(
      //   textCapitalization: TextCapitalization.sentences,
      //   readOnly: readOnly,
      //   autovalidateMode: autovalidateMode,
      //   validator: validator,
      //   onTap: onTap,
      //   controller: controller,
      //   maxLength: maxLength,
      //   maxLines: maxLines,
      //   minLines: minLines,
      //   keyboardType: keyboardType,
      //   textAlign: TextAlign.center,
      //   buildCounter: counter,
      //   style: TextStyle(
      //     fontSize: fontSize,
      //     fontWeight: fontWeight,
      //     color: Color(0xffFFFFFF),
      //   ),
      //   decoration: InputDecoration(
      //       hintStyle: TextStyle(
      //         color: hintStyle,
      //       ),
      //       prefixIcon: prefixIcon,
      //       filled: true,
      //       counterText: counterText,
      //       hintText: hintText,
      //       suffixIcon: suffixIcon,
      //       contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      //       enabledBorder: OutlineInputBorder(
      //         borderSide: BorderSide(color: Color(0xff6EBE30)),
      //         //36325A
      //         borderRadius: BorderRadius.circular(15),
      //       ),
      //       focusedErrorBorder: OutlineInputBorder(
      //         borderSide: BorderSide(color: Color(0xff6EBE30)),
      //         borderRadius: BorderRadius.circular(15),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderSide: BorderSide(color: Color(0xff6EBE30)),
      //         borderRadius: BorderRadius.circular(15),
      //       ),
      //       fillColor: fillColorhere),
      // ),
    );
  }

  Widget counter(BuildContext context,
      {required int currentLength,
        required int? maxLength,
        required bool isFocused}) {
    if (isFocused && currentLength > 0) {
      return Text('$currentLength / $maxLength');
    } else {
      return Text("");
    }
  }
}
