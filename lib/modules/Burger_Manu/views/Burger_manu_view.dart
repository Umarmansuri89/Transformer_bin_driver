import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../controllers/Burger_manu_controller.dart';

class Burger_manu_View extends GetView<Burger_manu_Controller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Color(0xff0D0B21),
        body :
        Container(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                  child: CupertinoActivityIndicator()
              );
            } else {
              return Stack(
                children: [
                  // Obx(() =>
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,

                    child: Image.asset("assets/Images/Burger_backgraund.png",fit: BoxFit.fill,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                controller.onDashboard();
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 20.0,),
                                child: TextFieldShow(
                                  height: 2,
                                  text: "Dashborad",
                                  color: Color(0xFFFFFFFF),
                                  fontsize: 28,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),

                            Padding(padding: EdgeInsets.only(right: 10),child: Container(
                              // width: MediaQuery.of(context).size.width,
                              child:  Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),)


                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,),
                        child: TextFieldShow(
                          height: 1.2,
                          text: "Schedule",
                          color: Color(0xFFFFFFFF),
                          fontsize: 28,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,),
                        child: TextFieldShow(
                          height: 1.2,
                          text: "Stock",
                          color: Color(0xFFFFFFFF),
                          fontsize: 28,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,),
                        child: TextFieldShow(
                          height: 1.2,
                          text: "Onsite",
                          color: Color(0xFFFFFFFF),
                          fontsize: 28,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,),
                        child: TextFieldShow(
                          height: 1.2,
                          text: "Payment Due",
                          color: Color(0xFFFFFFFF),
                          fontsize: 28,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w100,
                        ),
                      ),



                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height/4,
                            padding: EdgeInsets.only(top: 00,bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFieldShow(
                                  height: 1.2,
                                  text: "Settings",
                                  color: Color(0xFF2E2E2E),
                                  fontsize: 28,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFieldShow(
                                  height: 1.2,
                                  text: "Logout",
                                  color: Color(0xFF2E2E2E),
                                  fontsize: 28,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                          ),


                          Container(
                            // width: MediaQuery.of(context).size.width,
                            child: Image.asset("assets/Images/Cartun_Burger.png",fit: BoxFit.cover,height: 300,width: 195,),
                          ),

                        ],),
                    ],),
                ],
              );
            }
          }),
        )

    );
  }
}

onSubmit() {
  Get.toNamed(Routes.LOGIN);
}

void onNextPress() {
  print("onNextPress caught");
}
