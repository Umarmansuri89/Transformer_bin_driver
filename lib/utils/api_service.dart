import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shyam_trust_flutter/app/model/Event_details_model.dart';

class ApiService {
 static late final BuildContext context;
  /*-----------------SHYAM TRUST---------------------------*/
  static final String BASE_URL = "";

  static final String FAQ = "faq";


  /* //sanbox
  static final String cftokengenerate =
      "https://test.cashfree.com/api/v2/cftoken/order";
  static final String APPLICATION_ID = "111004fd8c8e4a74cdebd5fb21400111";
  static final String SECRET_ID = "b5ed1f01151ebf4f7c03b60cd080b6d686202bc3";*/

//live

  /*----------------EYE KANDY---------------------------*/

  Future Faq() async {
    final response = await http.get(
      Uri.parse(BASE_URL + FAQ),
      headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }





}
