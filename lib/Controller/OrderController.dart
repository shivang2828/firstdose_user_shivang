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
  // var isLoading = true.obs;
  RxBool processing = false.obs;
  var isLoadingList = false.obs;
  // var orderModel = OrderModel().obs;
  var orderModel = OrderModel(data: [].obs).obs;
  var Page = 1.obs;

  order() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    isLoadingList.value = (this.Page == 1) ? false : true;
    processing.value = (this.Page == 1) ? true : false;
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/orders');
    try {
      final response = await http.post(url, body: {
        "page": Page.value.toString(),
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


      if (status == 1) {
        processing.value = false;
        if (this.Page.value == 1) {
          processing.value = false;
          orderModel.value = OrderModel.fromJson(data);
        } else {
          isLoadingList.value = true;
          processing.value = false;
          final newModelData = OrderModel.fromJson(data);
          orderModel.value.data.value=
              orderModel.value.data.value + newModelData.data.value;
          isLoadingList.value = false;
        }
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
