import 'dart:convert';
import 'package:firstdose_user/homescreen/dashBoard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  var otpController = TextEditingController().obs;

  // Modify otpLogin to accept phoneNumber as a parameter
  otpLogin(String phoneNumber) async {
    if (otpController.value.text.isEmpty) {
      Get.snackbar('Error', 'Please enter OTP');
      return;
    }

    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/verify-otp/login');

    try {
      final response = await http.post(url, body: {
        "otp": otpController.value.text,
        "phone_number": phoneNumber,  // Use the passed phoneNumber
        "type": 'login',
        "device_details":'device_details',
        'api_version':'api_version',
        'device_type': 'android',
        'debug_mode':'debug_mode',
        "app_version":'app_version',
        'device_id':'device_id',
      });

      var data = jsonDecode(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        debugPrint('OTP Verified Successfully');
        Get.to(() => const HomeScreen());
      } else if (status == 0) {
        debugPrint(message ?? 'OTP verification failed');
        Get.snackbar('Error', message ?? 'OTP verification failed');
      } else {
        debugPrint('Something went wrong');
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to verify OTP. Please try again.');
    }
  }
}
