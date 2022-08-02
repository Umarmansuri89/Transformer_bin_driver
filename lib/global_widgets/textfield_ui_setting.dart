import 'package:flutter/material.dart';

class TextFieldSettingDesigned extends StatelessWidget {

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
  late final String? counterText;

  TextFieldSettingDesigned({
    this.onTap,
    this.readOnly = false,
    this.hintStyle,
    this.initialValue = "",
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
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          readOnly: readOnly,
          autovalidateMode: autovalidateMode,
          validator: validator,
          onTap: onTap,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: keyboardType,
          textAlign: textAlign,
          buildCounter: counter,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Color(0xffE6E3FF),
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: hintStyle,
            ),
            prefixIcon: prefixIcon,
            filled: true,
            counterText: counterText,
            hintText: hintText,
            suffixIcon: Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xffCCD2E3),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,


            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            fillColor: Colors.transparent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 40),
          child: Container(
            height: 0.5,
            color: Color(0xff36325A),
            width: double.infinity,
          ),
        )
      ],
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
