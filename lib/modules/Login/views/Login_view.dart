import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/textButtonDesign.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../global_widgets/textfield_ui.dart';
import '../controllers/Login_controller.dart';


class LoginView extends GetView<LoginController> {

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
            return Stack(
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
                                  fontsize: 69,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                child: Image.asset("assets/Images/carton.png",fit: BoxFit.cover,height: 300,width: 195,),
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
                                      vertical: MediaQuery.of(context).size.height * 0.01,
                                      horizontal: MediaQuery.of(context).size.height * 0.03),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null && value.length < 5) {
                                        return 'Invalid Password.';
                                      }
                                      return null;
                                    },
                                    cursorColor: Colors.white,
                                    //maxLength: 20,
                                    style: const TextStyle(color: Color(0xff000000)),
                                    controller: controller.passwordcontroller,
                                    obscureText: controller.obscureNewPass.value,
                                    decoration: InputDecoration(
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xffffffff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xffffffff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xffffffff)),
                                        //36325A
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xffffffff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: InputBorder.none,
                                      // prefixIcon: Icon(
                                      //   Icons.lock_outline,
                                      //   color: Color(0xffCCD2E3),
                                      //   size: 16.0,
                                      // ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 15, top: 13, bottom: 0, right: 15),
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      hintText: 'Password'.tr,
                                      hintStyle: const TextStyle(fontSize: 14.0, color:Color(0xffCCD2E3)),
                                      suffixIcon: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          controller.obscureNewPass.value =
                                          !controller.obscureNewPass.value;
                                        },
                                        child: Icon(
                                          controller.obscureNewPass.value
                                              ? Icons.remove_red_eye_outlined
                                              : Icons.remove_red_eye,
                                          size: 24,
                                          color: const Color.fromRGBO(142, 153, 183, 0.5),
                                        ),
                                      ),

                                    ),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0, right: MediaQuery.of(context).size.height * 0.032),
                                child: GestureDetector(
                                  // onTap: () => controller.onforgetPassword(),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:  [
                                      TextFieldShow(
                                        textAlign: TextAlign.end,
                                        text: "Forgot password ?",
                                        fontsize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ],
                                  ),
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
                                        text: 'Login',
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
              );
          }
        }),
      )

    );
  }

}
