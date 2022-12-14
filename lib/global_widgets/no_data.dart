import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transformer_bin_driver/global_widgets/textEnter.dart';



import '../utils/image_helper.dart';

// Note : photo video app bar worked diffrently
Center NoDataFoundDesing() => Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Image(
          image: AssetImage(NODATA),
          height: 30,
          width: 30,
        ),
        TextFieldShow(
          text: 'No data found...',
          fontsize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ],
    ));
