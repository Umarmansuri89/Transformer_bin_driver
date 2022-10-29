import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';
import '../controllers/Logout_controller.dart';

class Logout_View extends GetView<Logout_controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Logout"),
      body:
      Container(
        color: Color(0xffffffff),
        height: double.infinity,

        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            return
               SingleChildScrollView(
                child:
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 10,right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){

                                },
                                child:  const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox()
                                  // Icon(
                                  //   Icons.refresh,
                                  //   color: ColorValues.Lite_black,
                                  //   size: 24.0,
                                  //   semanticLabel: 'Text to announce in accessibility modes',
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextFieldShow(
                                  text: "Hello,",
                                  height: 1,
                                  color: ColorValues.info_text_color,
                                  fontsize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.25,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextFieldShow(
                                  text: "${controller.user_name.value}",
                                  height: 1,
                                  color: ColorValues.info_text_color,
                                  fontsize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.25,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.all(20),
                              //child: Image.asset("assets/Images/Small_carton.png",fit: BoxFit.cover,),
                              child:   SvgPicture.asset("assets/Images/Frame.svg")
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        onBackPressed(context);
                      },
                      child:  Container(
                          padding: const EdgeInsets.only(top: 140,left: 20,right: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 10,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding:  EdgeInsets.only(left: 10.0,right: 10,top: 20,bottom: 10),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextFieldShow(
                                          text: "Logout",
                                          height: 1,
                                          color: ColorValues.info_text_color,
                                          fontsize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.31,
                                        ),
                                      ],
                                    )
                                ),

                              ],
                            ),
                          )
                      ),
                    )

                  ],
                )

              );
          }
        }),
      )

    );
  }
  Future<bool?> onBackPressed(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return
            AlertDialog(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              backgroundColor: Colors.orange,
              title:
              Padding(padding: EdgeInsets.only(top: 20),child:  Center(
                child:
                Text(
                  'Do You Want To Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lato',
                  ),
                ),

                //Text('Do you want to exit ',),
              ),),


              content:
              Text(''),
              actionsAlignment: MainAxisAlignment.spaceEvenly,

              actions: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    child: Text(
                      'NO',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),),
                Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    child: Text(
                      'YES',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                    onPressed: () async {

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString(SDConstant.isLogin, "false");
                      prefs.setString('loginstatus', "false");

                      Get.offAllNamed(Routes.SPLASH);


                    },
                  ),
                ),),
              ],
            );
        });
  }
}
