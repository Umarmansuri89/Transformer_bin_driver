import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shyam_trust_flutter/app/model/Event_details_model.dart';

class ApiService {
 static late final BuildContext context;
  /*-----------------SHYAM TRUST---------------------------*/
  static const String BASE_URL = "https://xugar.me/demo/mock/transformer-bin-hire/Apicontroller/";

  static const String Login_api = "login";
  static const String forgetpassword_api = "forgetpassword";
  static const String resetpassword_api = "resetpassword";


  /* //sanbox
  static final String cftokengenerate =
      "https://test.cashfree.com/api/v2/cftoken/order";
  static final String APPLICATION_ID = "111004fd8c8e4a74cdebd5fb21400111";
  static final String SECRET_ID = "b5ed1f01151ebf4f7c03b60cd080b6d686202bc3";*/

//live

  /*----------------EYE KANDY---------------------------*/

  Future Login(email,password) async {
    final response = await http.post(
      Uri.parse(BASE_URL + Login_api),
      body: ({
              'email': email,
            'password': password
      })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future forgetpassword(email) async {
    final response = await http.post(
        Uri.parse(BASE_URL + forgetpassword_api),
        body: ({
          'email': email,
          //'password': password
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future Reset_password(password,user_id) async {
    final response = await http.post(
        Uri.parse(BASE_URL + resetpassword_api),
        body: ({
          'password': password,
          'user_id': user_id
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

}
