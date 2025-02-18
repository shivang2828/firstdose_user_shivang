import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/OrderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Const.dart';

class OrderController extends GetxController {
  var isLoading = true.obs;
  var orderModel = OrderModel().obs;

  order() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/orders');
    try {
      final response = await http.post(url, body: {
        "page": "1",
        "device_details": 'device_details',
        "api_version": 'api_version',
        "app_version": 'app_version',
        "device_type": "android",
        "device_id": 'device_id'
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      var data = json.decode(response.body);
      log(response.body);

      var status = data['status'];
      var message = data['message'];
      debugPrint('Error 1');

      if (status == 1) {
        debugPrint('Error');
        isLoading(false);
        orderModel.value = OrderModel.fromJson(data);
        debugPrint('Error 3');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
