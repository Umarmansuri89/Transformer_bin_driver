import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/image_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    //LocalNotificationService.initialize(context);
    return

      Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
                child: CupertinoActivityIndicator()
            );
          } else {
            return Stack(
              children: [
                /*  Obx(() => SizedBox(
            height: controller.count.value.toDouble(),
          )),*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(SPLASH_BACKGROUND,fit: BoxFit.fill),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: (){
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: TextFieldShow(
                                height: 05,
                                text: "TRANSFORMER BIN HIRE",
                                color: Color(0xFF333333),
                                fontsize: 30,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Image.asset(
                            SPLASH_LOGO,
                            width: 200,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      );


  }
}
