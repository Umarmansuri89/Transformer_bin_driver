import 'package:flutter/material.dart';

class TextFieldTimeDesigned extends StatelessWidget {
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

  TextFieldTimeDesigned({
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
    this.maxLines = 1,
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
    return SizedBox(
      height: 35,
      child: TextFormField(
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
        textAlign: TextAlign.center,
        buildCounter: counter,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Color(0xffFFFFFF),
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
            contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6EBE30)),
              //36325A
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6EBE30)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6EBE30)),
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: fillColorhere),
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
