import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../global_widgets/textButtonDesign.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../global_widgets/textfield_ui.dart';
import '../controllers/Otp_controller.dart';


class Otp_view extends GetView<Otp_controller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
     // color: Color(0xff0D0B21),
      body : Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CupertinoActivityIndicator()
            );
          }
          else {
            return
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child:   Stack(
                    children: [
                      // Obx(() =>
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/Images/login_background.png",fit: BoxFit.fill),
                      ),
                      Stack(
                        // alignment: AlignmentDirectional.topCenter,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0.0),
                                  child: TextFieldShow(
                                    height: 05,
                                    text: "TRANSFORMER BIN HIRE",
                                    color: Color(0xFF333333),
                                    fontsize: 30,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: TextFieldShow(
                                      height: 2,
                                      text: "Hello!",
                                      color: Color(0xFFF79534),
                                      fontsize: 60,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width,
                                    child: Image.asset("assets/Images/carton.png",fit: BoxFit.fill,height: 300,width: 190,),
                                  ),

                                ],),
                            ],),

                          Stack(
                            children: [

                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:<Widget> [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/1.7,
                                    width: double.infinity,
                                    child: Image.asset("assets/Images/Login_Botttom.png",fit: BoxFit.fill),
                                  ),

                                ],),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: <Widget>[

                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0,bottom: 20),
                                    child: TextFieldShow(
                                      height: 2,
                                      text: "OTP Verify",
                                      color: Color(0xFFFfffff),
                                      fontsize: 40,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: MediaQuery.of(context).size.height * 0.03),
                                      child:
                                      /*  TextFieldDesigned(

                                  controller: controller.emailController,

                                  validator: (value) {
                                    if (value != null && !value.isEmail) {
                                      return 'Invalid Email ID.';
                                    }
                                    return null;
                                  },
                                  maxLines: 2,
                                  fontSize: 14,
                                  maxLength: 50,
                                  minLines: 1,
                                  hintText: "E-mail",
                                  hintStyle: const Color(0xffCCD2E3),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  readOnly: false,
                                  keyboardType: TextInputType.text,

                                  // prefixIcon: Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffCCD2E3),
                                  //   size: 16.0,
                                  // ),
                                ),*/
                                      PinCodeTextField(
                                        appContext: context,
                                        pastedTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "customLight",
                                        ),
                                        length: 6,
                                        obscureText: false,
                                        obscuringCharacter: '*',
                                        // animationType: AnimationType.fade,
                                        validator: (v) {
                                          /*    if (v.length < 3) {
                    return "I'm from validator";
                  } else {
                    return null;
                  }*/
                                        },
                                        pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius: BorderRadius.circular(5),
                                          fieldHeight: 40,
                                          fieldWidth: 40,
                                          errorBorderColor: Colors.red,
                                          inactiveFillColor: Colors.white,
                                          borderWidth: 0.0,
                                          // disabledColor: Colors.white,
                                          // inactiveColor: Colors.white,
                                          activeFillColor: controller.hasError ? Colors.white : Colors.white,
                                        ),
                                        cursorColor: Colors.black,
                                        animationDuration: Duration(milliseconds: 300),
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          height: 1.6,
                                          fontFamily: "customLight",
                                        ),
                                        backgroundColor: Color(0xffffff),
                                        enableActiveFill: true,
                                        errorAnimationController: controller.errorController,
                                        controller: controller.textEditingController,
                                        keyboardType: TextInputType.number,
                                        boxShadows: [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            color: Colors.black12,
                                            blurRadius: 10,
                                          )
                                        ],
                                        onCompleted: (v) {
                                          print("Completed");
                                        },
                                        // onTap: () {
                                        //   print("Pressed");
                                        // },
                                        onChanged: (value) {
                                          print(value);
                                          //setState(() {
                                          controller.currentText.value = value;
                                          // });
                                        },
                                        beforeTextPaste: (text) {
                                          print("Allowing to paste $text");
                                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                          return true;
                                        },
                                      )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context).size.height * 0.030,
                                          horizontal: MediaQuery.of(context).size.height * 0.03),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xff000000),
                                            // border: Border.all(
                                            //   color: Colors.black,
                                            //   width: 8,
                                            // ),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child:TextButtonDesign(
                                            text: 'Send OTP',
                                            onSubmit: () {
                                              controller.onLogin();
                                              // Get.to(SCHED_view());

                                            },
                                          )
                                      ))
                                ],
                              )

                            ],)

                        ],
                      )
                    ],
                  ),
                ),
              );


          }
        }),
      )

    );
  }

}
