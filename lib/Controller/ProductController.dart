import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = true.obs;

  var productModel = ProductModel().obs;

  product() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/products');
    try {
      final response = await http.post(url, body: {
        "device_details": 'device_details',
        "app_version": 'app_version',
        'device_id': 'device_id',
        'api_version': 'api_version',
        'device_type': 'android',
        'debug_mode': 'debug_mode'
      }, headers: {});

      // if (response.statusCode == 200) {
      //   setState(() {
      var data = json.decode(response.body);
      log(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        isLoading(false);

        productModel.value = ProductModel.fromJson(data);

        debugPrint(productModel.value.data!.products![0].name);
      } else if (status == 0) {
      } else {}
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to Send OTP. Please try again.');
    }
  }
}
