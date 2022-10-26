import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:transformer_bin_driver/routes/app_pages.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {

  /* await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);*/
  await FlutterDownloader.initialize(
      debug: true,
      ignoreSsl: true// optional: set to false to disable printing logs to console (default: true)
      //ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );

  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /* scaffoldBackgroundColor: const Color(0xFFEFEFEF),*/
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xff0D0B21),
          accentColor: Colors.white,
          textSelectionTheme:
          TextSelectionThemeData(cursorColor: Colors.black)),
    ),
  );
}
