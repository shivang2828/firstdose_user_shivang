import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/WishListModel.dart';
import '../Utils/Const.dart';

class WishListController extends GetxController {
  var wishListModel = WishListModel().obs;
  var isLoading = false.obs;

  // var IsLogin = false.obs;
  var addedInWishList = 0.obs;

  fetchWishList() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/wishlist');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    // var IsLogin = sharedPref.getBool(isLogin) ;

    isLoading(true);

    try {
      final response = await http.post(
        url,
        body: {"flag": "all"},
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      debugPrint(url.toString());

      var data = json.decode(response.body);
      var status = data['status'];
      var message = data['message'];
      // var _IsLogin = IsLogin;

      log('API Response: ${response.body}');

      if (status == 1) {
        isLoading(false);

        debugPrint('Something wrong but api is working');
        wishListModel.value = WishListModel.fromJson(data);

        debugPrint('Wishlist fetched successfully: $message');
      } else {
        isLoading(false);

        // log('Status: $status, Message: $message');

        debugPrint('Something wrong');
      }
    } catch (e) {
      debugPrint('Error: $e');
      // Get.snackbar('Error', 'Failed to fetch wishlist: $e');
    } finally {
      isLoading(false);
    }
  }

  addToWishList(String productId) async {
    await _modifyWishList("add", productId);
  }

  removeProductFromWishList(String productId) async {
    await _modifyWishList("remove_product", productId);
  }

  _modifyWishList(String flag, String productId) async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/wishlist');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    isLoading(true);

    try {
      final response = await http.post(
        url,
        body: {"flag": flag, "product_id": productId.toString()},
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        log(response.body);
        log(url.toString());
        log(flag.toString());
        log(productId.toString());

        var status = data['status'];
        var message = data['message'];

        if (status == 1) {
          isLoading(false);
          debugPrint(message);
        }
      } else {
        Get.snackbar('Products already added to the wishlist', '');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to modify wishlist: $e');
    }
  }
}
