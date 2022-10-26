import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/Forgotpassword/bindings/Forgotpassword_binding.dart';
import 'package:transformer_bin_driver/modules/Forgotpassword/views/Forgotpassword_view.dart';
import 'package:transformer_bin_driver/modules/Google_mep_full/views/Google_mep_full_view.dart';
import 'package:transformer_bin_driver/modules/Job_Type_Status/bindings/Jobtype_status_binding.dart';
import 'package:transformer_bin_driver/modules/Job_Type_Status/views/Jobtype_status_view.dart';
import 'package:transformer_bin_driver/modules/Job_list/bindings/Job_list_binding.dart';
import 'package:transformer_bin_driver/modules/Job_list/views/Job_list_view.dart';
import 'package:transformer_bin_driver/modules/New_password/bindings/New_password_binding.dart';
import 'package:transformer_bin_driver/modules/New_password/views/New_password_view.dart';
import 'package:transformer_bin_driver/modules/Otp/bindings/Otp_binding.dart';
import 'package:transformer_bin_driver/modules/Otp/views/Otp_view.dart';
import 'package:transformer_bin_driver/modules/jobtype_long/bindings/jobtype_long_biding.dart';
import 'package:transformer_bin_driver/modules/splash/bindings/splash_binding.dart';
import 'package:transformer_bin_driver/modules/splash/views/splash_view.dart';
import '../modules/Deshboard/bindings/Dashboard_screen_binding.dart';
import '../modules/Deshboard/views/Dashboard_screen_view.dart';
import '../modules/Google_mep_full/bindings/Google_mep_full_binding.dart';
import '../modules/Job_Type/bindings/Jobtype_binding.dart';
import '../modules/Job_Type/views/Jobtype_view.dart';
import '../modules/Login/bindings/Login_binding.dart';
import '../modules/Login/views/Login_view.dart';
import '../modules/jobtype_long/Views/jobtype_long_View.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => Otp_view(),
      binding: Otp_binding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => Forgotpassword_view(),
      binding: Forgotpassword_binding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => New_password_view(),
      binding: New_password_binding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_SCREEN,
      page: () => Dashboard_screen_View(),
      binding: Deshboard_screen_Binding(),
    ),
    GetPage(
      name: _Paths.JOBTYPE_LONG,
      page: () => jobtype_long_View(),
      binding: jobtype_long_Binding(),
    ),
    GetPage(
      name: _Paths.JOBTYPE,
      page: () => JobtypeView(),
      binding: Jobtype_Binding(),
    ),
    GetPage(
      name: _Paths.JOBTYPE_STATUS,
      page: () => Jobtype_status_View(),
      binding: Jobtype_status_Binding(),
    ),
    GetPage(
      name: _Paths.JOB_LIST,
      page: () => Job_list_View(),
      binding: Job_list_binding(),
    ),
    GetPage(
      name: _Paths.GOOGLE_MEP,
      page: () => Google_mep_full_view(),
      binding: Google_mep_full_binding(),
    ),
  ];
}
