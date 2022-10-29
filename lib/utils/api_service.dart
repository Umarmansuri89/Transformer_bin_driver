import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../global_widgets/progress_dialog.dart';

class ApiService {
  static late final BuildContext context;
  /*-----------------SHYAM TRUST---------------------------*/
  static const String BASE_URL = "https://xugar.me/demo/mock/transformer-bin-hire/Apicontroller/";

  static const String Login_api = "login";
  static const String forgetpassword_api = "forgetpassword";
  static const String resetpassword_api = "resetpassword";
  static const String MY_JOBS = "GetMyJobs";
  static const String UPDATE_JOB_STATUS = "update_status";
  static const String Get_Job_Detail = "GetJobDetail";
  static const String Year_List = "YearList";
  static const String Get_Payment_status = "Payment_status";
  static const String AddNotes = "/AddNotes";
  static const String GetNotes = "/GetNotes";
  static const String SendReceipt  = "/SendReceipt";
  static const String ContactUs  = "/ContactUs";
  static const String MyProfile  = "/MyProfile";
  static const String Edit_Profile  = "/EditProfile";
  //https://xugar.me/demo/mock/transformer-bin-hire/Apicontroller


  /*-------------------------------------------*/

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


  Future my_jobs(user_id,date) async {
    print("api=====+++++=======$date");
    final response = await http.post(
        Uri.parse(BASE_URL + MY_JOBS),
        body: ({
          'user_id': user_id,
          'date': date
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future My_Profile(user_id) async {
    final response = await http.post(
        Uri.parse(BASE_URL + MyProfile),
        body: ({
          'user_id': user_id,
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Update_Profile(user_id,first_name,last_name,mobile) async {
    final response = await http.post(
        Uri.parse(BASE_URL + Edit_Profile),
        body: ({
          'user_id': user_id,
          'first_name': first_name,
          'last_name': last_name,
          'mobile': mobile,
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Notes(driver_id,job_id,note) async {
    print("api=====+++++=======$driver_id");
    print("api=====+++++=======$job_id");
    print("api=====+++++=======$note");
    final response = await http.post(
        Uri.parse(BASE_URL + AddNotes),
        body: ({
          'driver_id': driver_id,
          'job_id': job_id,
          'note': note,
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future GetNote(driver_id,job_id) async {
    print("api=====+++++=======$driver_id");
    print("job_idapi=====+++++=======$job_id");
    final response = await http.post(
        Uri.parse(BASE_URL + GetNotes),
        body: ({
          'driver_id': driver_id,
          'job_id': job_id,
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future Get_Year_List() async {
    final response = await http.get(
      Uri.parse(BASE_URL + Year_List),
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Contact_Us() async {
    final response = await http.get(
      Uri.parse(BASE_URL + ContactUs),
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future Get_Payment_List() async {
    final response = await http.get(
      Uri.parse(BASE_URL + Get_Payment_status),
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future GetJobDetail(job_id,user_id) async {
    print("api=====+++++=======$job_id");
    print("api=====+++++=======$user_id");
    final response = await http.post(
        Uri.parse(BASE_URL + Get_Job_Detail),
        body: ({
          'job_id': job_id,
          'user_id': user_id,
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future Send_Receipt(order_number) async {
    print("api=====+++++=======$order_number");
    final response = await http.post(
        Uri.parse(BASE_URL + SendReceipt),
        body: ({
          'order_number': order_number,
        })
      //headers: {HttpHeaders.acceptHeader: "application/json"},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }




/*Future FileUpload(String id,String status, File file) async{

    print("============${id}");
    print("============${status}");
    print("============${file}");
   //create multipart request for POST or PATCH method
   var request = http.MultipartRequest("POST", Uri.parse(BASE_URL + UPDATE_JOB_STATUS));
   //add text fields
   request.fields["job_id"] = id;
   request.fields["status"] = status;
   //create multipart using filepath, string or bytes
   var pic = await http.MultipartFile.fromPath("image", file.path);

   var response = await request.send();

   //Get the response from the server
   var responseData = await response.stream.toBytes();
   var responseString = String.fromCharCodes(responseData);
   print('====$response');
   print('====$responseData');
   print('=======$responseString');
   //var ConvertDataToJson = jsonDecode(re);
   return responseString;
 }*/


}
