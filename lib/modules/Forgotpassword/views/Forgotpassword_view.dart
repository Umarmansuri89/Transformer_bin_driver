import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/textButtonDesign.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../global_widgets/textfield_ui.dart';
import '../controllers/Forgotpassword_controller.dart';


class Forgotpassword_view extends GetView<Forgotpassword_controller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child:  Stack(
                    children: [
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
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: MediaQuery.of(context).size.height * 0.03),
                                    child: TextFieldDesigned(

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
                                    ),
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

                                              controller.Forgot_pass();

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
