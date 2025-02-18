import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Views/Auth/otpScreen.dart';

class LoginController extends GetxController {
  // Define the TextEditingController for the phone input
  var phoneController = TextEditingController().obs;

  String token = '';

  userLogin() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/send-otp');

    try {
      final response = await http.post(url, body: {
        "phone_number": phoneController.value.text,
        "device_details": 'device_details',
        "app_version": 'app_version',
        'device_id': 'device_id',
        'api_version': 'api_version',
        'device_type': 'android',
        'debug_mode': 'debug_mode'
      }, headers: {});


      var data = json.decode(response.body);
      debugPrint(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        debugPrint('OTP Send Successfully');



        Get.to(() => Otpscreen(phoneNumber: phoneController.value.text));
      } else if (status == 0) {
        debugPrint(message ?? 'OTP send failed');
        Get.snackbar('Error', message ?? 'OTP send failed');
      } else {
        debugPrint('Something went wrong');
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to Send OTP. Please try again.');
    }

  }


}
