import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Const.dart';

class ProductController extends GetxController {
  // var isLoading = true.obs;
  var isLoading = true.obs;
  var isLoadMore = false.obs;
  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var hasMore = false.obs;

  var productModel = ProductModel().obs;

  product(String categoryID,   {required int page} ) async {
    if (page == 1) {
      isLoading(true);
    } else {
      isLoadMore(true);
    }
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/products');
    try {
      final response = await http.post(url, body: {
        "device_details": 'device_details',
        "app_version": 'app_version',
        'device_id': 'device_id',
        'category_id': categoryID.toString(),
        "page": page.toString(),
        // "product_id": productID,
        "is_popular": "0",
        'api_version': 'api_version',
        'device_type': 'android',
        'debug_mode': 'debug_mode'
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      // if (response.statusCode == 200) {z
      //   setState(() {
      var data = json.decode(response.body);
      log(response.body);
      // log(url.toString());
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        isLoading(false);

        productModel.value = ProductModel.fromJson(data);


        debugPrint(productModel.value.data!.products![0].name);
        debugPrint('${url}');
        debugPrint('${ApiToken}');
      }
      // else if (status == '0') {
      //   // Get.snackbar(' This product is already available in the cart', '');
      //
      // }
      else {
        Get.snackbar('Product added to cart', '');
      }
    } catch (e) {
      debugPrint('Error: $e');
      // Get.snackbar('Error', 'Failed to Load Data. Please try again.');
    }
  }
  void loadNextPage(String categoryID) {
    if (hasMore.value && !isLoadMore.value) {
      currentPage.value++;
      product(categoryID, page: currentPage.value);
    }
  }
}
