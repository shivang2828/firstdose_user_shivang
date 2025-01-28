import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/ProductDetailModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductDetailController extends GetxController {

  var productdetailModel = ProductDetailModel().obs;

  var isLoading = true.obs;

  productdetails() async {
    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/product-detail');

    try {
      final response = await http.post(url, body: {
        "device_details": "device_details",
        "api_version": "api_version",
        "app_version": "app_version",
        "device_type": "android",
        "device_id": "device_id",
        "product_id": "1",
      }, headers: {});


      var data = jsonDecode(response.body);
      log(response.body);
      var status= data['status'];
      var message = data['message'];




      if (status == 1) {


        isLoading(false);
        productdetailModel.value = ProductDetailModel.fromJson(data);

        debugPrint(productdetailModel.value.data!.products![0].description);


      } else if (status == 0) {
      } else {}





    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to Send OTP. Please try again.');
    }
  }
}
