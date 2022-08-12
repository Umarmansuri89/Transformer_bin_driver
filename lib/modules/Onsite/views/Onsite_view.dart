import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transformer_bin_driver/global_widgets/appBar_Sccener.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';

import '../../../global_widgets/Text_field_information.dart';
import '../../../global_widgets/ToggleButton.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';



class Onsite_View extends StatelessWidget {



  Onsite_View({Key? key}) : super(key: key);
  final _currentIndex = 0.obs;
  final controller = Get.put(Jobtype_controler());

  String? Product_name="UNPAID";
  String? drop_down_item;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //ApiService.context = context;
    return Scaffold(
      appBar: appbar_Scner("12/12/2022", onTap),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: TextFieldShow(
                    height: 2,
                    text: "Bin Locations Map",
                    color: Colors.black,
                    fontsize: 23,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),

               // Image.asset("assets/Images/filter.png",height: 40,width: 100,),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
onTap() {
  Get.toNamed(Routes.LOGIN);
}




// class InformationView extends StatefulWidget {




