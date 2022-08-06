import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/ColorValues.dart';

class Schedule_controller extends GetxController{

  var isLoading = false.obs;
  List color=[
    ColorValues.dashbboard_card_back_colorrr,
    ColorValues.dashbboard_card_back_colorr,
    ColorValues.dashbboard_card_back_colorrrr,
  ];


  void onInfo() async {
    Get.toNamed(Routes.JOBTYPE_LONG);
  }


  void onJobtype() async {
    Get.toNamed(Routes.JOBTYPE);
  }

  final count = 0.obs;
  final textColor = 0xffFFFFFF.obs;
  final Hide_leading=[].obs;
  final static_Status_list=[0,0,0,0,0,1,0,0,0,0].obs;

  var Colorlist=[].obs;
  final current = 0.obs;
  final dob = "".obs;
  final dateSelected = "".obs;
  final List<GlobalKey<ExpansionTileCardState>> cardKeyList = [];
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  DateTime currentDate = DateTime.now();

  // final count = 0.obs;
  // final TextEditingController note_Controller = TextEditingController(text: "");


  void onDashboard() async {
    Get.toNamed(Routes.INFORMTION);
  }

}
