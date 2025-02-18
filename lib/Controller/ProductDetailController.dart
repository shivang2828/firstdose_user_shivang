import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/ProductDetailModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Const.dart';

class ProductDetailController extends GetxController {
  var productdetailModel = ProductDetailModel().obs;

  var isLoading = true.obs;
  var count = 0.obs;

  void productdetails(String productID) async {
    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/product-detail');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    try {
      final response = await http.post(url, body: {
        "device_details": "device_details",
        "api_version": "api_version",
        "app_version": "app_version",
        "device_type": "android",
        "device_id": "device_id",
        "product_id": productID,
      },headers: {"Authorization": 'Bearer $ApiToken'},
      );

      var data = jsonDecode(response.body);
      log(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        isLoading(false);
        productdetailModel.value = ProductDetailModel.fromJson(data);
        count.value = productdetailModel.value.data!.products![0].cartQuantity!;
        debugPrint('${url}');
        // debugPrint('${ApiToken}');

        // debugPrint(productdetailModel.value.data!.products![0].description);
      } else if (status == 0) {
      } else {}
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to Send OTP. Please try again.');
    }
  }
   addToCart(String productId, String quntity) async {
    // buttonProcessing.value = true;


    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
      Map<String, dynamic> params ={
        "product_id": productId,
        "quantity": quntity,
      };

    try{
      Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/add-to-cart');
      final response = await http.post(url, body: params,
      // {
      //   "product_id": productId,
      //   "quantity": quntity,
      // },
          headers: {
            "Authorization": 'Bearer $ApiToken',
          }
      );

      var data = jsonDecode(response.body);
      var status = data['status'];

      log(response.body);
      if (status == 1) {
       debugPrint('${url}');
       debugPrint('${ApiToken}');
       debugPrint('${params}');


      } else if (status == 0) {

      }
    }catch(e){
      debugPrint("${e}");
    }

  }
}
