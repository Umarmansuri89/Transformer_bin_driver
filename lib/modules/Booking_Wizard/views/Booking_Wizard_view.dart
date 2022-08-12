import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/CustomDropdownButton2.dart';
import '../../../global_widgets/appBar_Sccener.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';
import '../controllers/Booking_Wizard_controller.dart';

class Booking_Wizard_view extends StatefulWidget {
  const Booking_Wizard_view({Key? key}) : super(key: key);

  @override
  State<Booking_Wizard_view> createState() => _Booking_Wizard_viewState();
}

class _Booking_Wizard_viewState extends State<Booking_Wizard_view> {


  final _currentIndex = 0.obs;
  final controller = Get.put(Booking_Wizard_controler());


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


  final List<String> items = [
    "sds"
  ];

  @override
  Widget build(BuildContext context) {
    print("=========");

    //ApiService.context = context;
    return Scaffold(
      appBar: appbar_Scner("12/12/2022", onTap),
      body:
      Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CupertinoActivityIndicator()
            );
          }
          else {
            return  Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldShow(
                            text: "Booking Wizard",
                            color: ColorValues.info_text_color,
                            fontsize: 23,
                            fontWeight: FontWeight.w600,
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color:  Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(

                          controller: controller.search_Controller,
                          decoration: InputDecoration(

                            suffixIcon: Container(
                              width: 10,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      print('mic button pressed');
                                    },
                                    icon: Icon(Icons.location_on_outlined),
                                  ),
                                ],
                              ),
                            ),
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
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
                                  "Select City",
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
                            setState(() {

                            });
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
                              color: Color(0xffF79534),
                              //36325A
                            ),
                            color: Color(0xffF79534),
                            //image: DecorationImage(image: AssetImage(BORDER_PNG)),
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding: EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xffF79534),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 5,
                          scrollbarAlwaysShow: true,
                        ),
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
                                  "Select City",
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
                            setState(() {

                            });
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
                              color: Color(0xffF79534),
                              //36325A
                            ),
                            color: Color(0xffF79534),
                            //image: DecorationImage(image: AssetImage(BORDER_PNG)),
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding: EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xffF79534),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 5,
                          scrollbarAlwaysShow: true,
                        ),
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
                                  "Select City",
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
                            setState(() {

                            });
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
                              color: Color(0xffF79534),
                              //36325A
                            ),
                            color: Color(0xffF79534),
                            //image: DecorationImage(image: AssetImage(BORDER_PNG)),
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding: EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xffF79534),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 5,
                          scrollbarAlwaysShow: true,
                        ),
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
                                  "Select City",
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
                            setState(() {

                            });
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
                              color: Color(0xffF79534),
                              //36325A
                            ),
                            color: Color(0xffF79534),
                            //image: DecorationImage(image: AssetImage(BORDER_PNG)),
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding: EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xffF79534),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 5,
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        //color: ColorValues.BLACK,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:  Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: TextFieldShow(
                            height: 02,
                            text: "Search",
                            color: Color(0xFFffffff),
                            fontsize: 17,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),


                  ],)

            );
          }
        }),
      )


    );

  }
}
onTap() {
  Get.toNamed(Routes.LOGIN);
}




// class InformationView extends StatefulWidget {




