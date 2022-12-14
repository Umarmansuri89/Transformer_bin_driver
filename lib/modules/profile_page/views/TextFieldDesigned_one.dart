import 'package:flutter/material.dart';

class TextFieldDesigned_one extends StatelessWidget {
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Color? hintStyle;
  final Color? cursorColor;
  final String hintText;
  final String initialValue;
  final int maxLength, minLines;
  final int maxLines;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyboardType;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  late final String? counterText;

  TextFieldDesigned_one({
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.controller,
    this.hintStyle = Colors.white12,
    this.initialValue = "",
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300,
    this.autovalidateMode,
    this.hintText = "",
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength = 300,
    this.validator,
    this.keyboardType = TextInputType.number,
    this.textAlign = TextAlign.start,
    this.counterText = "",
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      cursorColor: cursorColor,
      textCapitalization: TextCapitalization.sentences,
      readOnly: readOnly,
      autovalidateMode: autovalidateMode,
      validator: validator,
      onTap: onTap,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textAlign: textAlign,
      buildCounter: counter,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Color(0xff000000),
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: hintStyle,
        ),
        prefixIcon: prefixIcon,
        filled: true,
        counterText: counterText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff000000)),
          //36325A
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF0000)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF0000)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffffffff)),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        fillColor: Colors.white,
      ),
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
