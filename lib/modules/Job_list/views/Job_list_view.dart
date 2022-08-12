import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transformer_bin_driver/global_widgets/appBar_Sccener.dart';
import 'package:transformer_bin_driver/modules/Job_Type/controllers/Jobtype_controller.dart';
import 'package:transformer_bin_driver/modules/Job_list/controllers/Job_list_controller.dart';

import '../../../global_widgets/Text_field_information.dart';
import '../../../global_widgets/ToggleButton.dart';
import '../../../global_widgets/appBar_with_subtitle.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';



class Job_list_View extends StatelessWidget {


  Job_list_View({Key? key}) : super(key: key);
  final _currentIndex = 0.obs;
  final controller = Get.put(Job_list_controler());

  String? Product_name="UNPAID";
  String? drop_down_item;

  List<DropdownMenuItem<String>> _dropDownProduct() {
    List<String> ddl = ["UNPAID","CNC", "BO", "CO"];
    return ddl.map((value) => DropdownMenuItem(
      value: value,
      child: Text(value),
    ))
        .toList();
  }

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
                    text: "Jobs",
                    color: Colors.black,
                    fontsize: 23,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Image.asset("assets/Images/filter.png",height: 40,width: 100,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10, right: 10, bottom: 5),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        "status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: controller.items
                    .map((item) => DropdownMenuItem<String>(
                  //  value: item.id.toString(),
                  child: Text(
                    item.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
                    .toList(),
                //value: controller.selectedValue,
                value: controller.selectedValue1,
                onChanged: (value) {
                  // Toast.show(value.toString());
                  // setState(() {
                  //
                  // });
                  controller.selectedValue_city.value = value.toString();
                  controller.selectedValue1 = value.toString();
                  print("+========${controller.selectedValue_city.value}");
                  print("+========${controller.selectedValue1}");
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                ),
                iconOnClick: const Icon(
                  Icons.keyboard_arrow_up,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: double.infinity,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownPadding: EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Color(0xffcbc7c7),
                    //36325A
                  ),
                  color: Colors.transparent,
                  //image: DecorationImage(image: AssetImage(BORDER_PNG)),
                ),
                buttonElevation: 2,
                itemHeight: 40,
                itemPadding: EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xffffffff),
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 5,
                scrollbarAlwaysShow: true,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 00,left: 20,right: 20),
            child: Container(
              margin: const EdgeInsets.only( top: 00, left: 5, right: 5,bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child:  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(top: 5,left: 00,right: 00),
                          height: 61,
                          decoration: BoxDecoration(
                              color: Color(0xffFFEDDC),
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: TextFieldShow(
                                        height: 2,
                                        text: "Armstrong Street Creswik",
                                        color: Colors.black,
                                        fontsize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    Container(
                                      child: TextFieldShow(
                                        height: 2,
                                        text: "#1422",
                                        color: Colors.black,
                                        fontsize: 11,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: TextFieldShow(
                                        text: "18/07 - 25/07 Paying Cash",
                                        color: Colors.black,
                                        fontsize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    Container(
                                      child: TextFieldShow(
                                        text: "DELIVERED",
                                        color: Colors.black,
                                        fontsize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),


                        );
                      },
                    ),
                  )
                ],),
            ),
          ),

          /*ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {

                return Container(
                  margin: EdgeInsets.only(top: 5,left: 20,right: 20),
                  height: 61,
                  decoration: BoxDecoration(
                      color: Color(0xffFFEDDC),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: TextFieldShow(
                                height: 2,
                                text: "Armstrong Street Creswik",
                                color: Colors.black,
                                fontsize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            Container(
                              child: TextFieldShow(
                                height: 2,
                                text: "#1422",
                                color: Colors.black,
                                fontsize: 11,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: TextFieldShow(
                                text: "18/07 - 25/07 Paying Cash",
                                color: Colors.black,
                                fontsize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            Container(
                              child: TextFieldShow(
                                text: "DELIVERED",
                                color: Colors.black,
                                fontsize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),


                );

              }
          ),*/

        ],
      ),
    );

  }
}
onTap() {
  Get.toNamed(Routes.LOGIN);
}




// class InformationView extends StatefulWidget {




