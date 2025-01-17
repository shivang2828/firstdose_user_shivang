import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  // Define the TextEditingController for the phone input
  var phoneController = TextEditingController().obs;

  userLogin() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/send-otp');

    final response =
    await http.post(url, body: {"phone_number": phoneController.value.text,"device_details":'device_details',"app_version":'app_version','device_id':'device_id','api_version':'api_version','device_type': 'android','debug_mode':'debug_mode'}, headers: {});

    // if (response.statusCode == 200) {
    //   setState(() {
    var data = json.decode(response.body);
    debugPrint(response.body);
    // });









  }

// Optionally, you can add other logic for managing the phone number
}
