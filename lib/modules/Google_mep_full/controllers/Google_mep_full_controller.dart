import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../routes/app_pages.dart';


class Google_mep_full_controller extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;
  final current = 0.obs;

  @override
  void onInit() {
    print('==========${Get.parameters['let'].toString()}');
    print('==========${Get.parameters['long'].toString()}');
    // TODO: implement onInit
    super.onInit();
  }



  @override
  void onClose() {}

  void increment() => count.value++;

  void onDashboard() async {
    //Get.toNamed(Routes.DASHBOARD_SCREEN);
  }

  void onSCHED() async {
    Get.toNamed(Routes.SCHED);
  }

  void onPaymentDue() async {
    Get.toNamed(Routes.PAYMENT_DUE);
  }
}
