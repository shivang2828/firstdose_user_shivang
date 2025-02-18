import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Const.dart';
import 'package:http/http.dart' as http;

import '../Views/Auth/loginScreen.dart';

class LogOutController extends GetxController {


  userLogout() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/logout');
    // SharedPreferences sharedPref = await SharedPreferences.getInstance();
    // var ApiToken = sharedPref.getString(apiToken);
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken=sharedPref.getString(apiToken);


    debugPrint(ApiToken);

    try {
      final response = await http.post(url, body: {
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });


      var data = json.decode(response.body);
      debugPrint(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        SharedPreferences sharedPref =
        await SharedPreferences.getInstance();

        await sharedPref.clear();
        Get.offAll(() => LoginScreen());
        debugPrint('Logout Successfully');
      } else {
        debugPrint('Logout Failed');
        debugPrint(message);
      }
    } catch (e) {
         debugPrint(e as String?);
    }
  }
}
