// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:firstdose_user/Models/WishListModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Utils/Const.dart';
//
// class WishListController extends GetxController {
//   var wishListModel = WishListModel().obs;
//   var isLoading = true.obs;
//
//   wishList() async {
//     Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/wishlist');
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//     try {
//       final response = await http.post(url, body: {
//         // flag = add
//         // "flag": "add",
//         // "product_id": "40",
//
//         // flag remove
//         // "flag": "remove"
//
//         // flag remove_product
//         // "flag": "remove_product",
//         // "product_id": "3",
//
//         // flag all
//         "flag": "all"
//       }, headers: {
//         "Authorization": 'Bearer $ApiToken'
//       });
//
//       // if (response.statusCode == 200) {
//       //   setState(() {
//       var data = json.decode(response.body);
//       log(response.body);
//       var status = data['status'];
//       var message = data['message'];
//
//       if (status == 1) {
//         isLoading(false);
//         wishListModel.value = WishListModel.fromJson(data);
//         debugPrint(message);
//
//       }  else {
//
//       }
//     } catch (e) {
//       debugPrint('Error: $e');
//       Get.snackbar('Error', 'Failed To Add ');
//     }
//   }
// }
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


   fetchWishList() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/wishlist');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    isLoading(true);

    try {
      final response = await http.post(
        url,
        body: {"flag": "all"},
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      log('API Response: ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var status = data['status'];
        var message = data['message'];

        log('Status: $status, Message: $message');

        if (status == "1") {
          wishListModel.value = WishListModel.fromJson(data);
          debugPrint('Wishlist fetched successfully: $message');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch wishlist: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to fetch wishlist: $e');
    } finally {
      isLoading(false);
    }
  }



   addToWishList(String productId) async {
    await _modifyWishList("add", productId);
  }



  Future<void> removeProductFromWishList(String productId) async {
    await _modifyWishList("remove_product", productId);
  }

  Future<void> _modifyWishList(String flag, String productId) async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/wishlist');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    isLoading(true); // Start loading

    try {
      final response = await http.post(
        url,
        body: {"flag": flag, "product_id": productId.toString()},
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        log(response.body);

        var status = data['status'];
        var message = data['message'];

        if (status == "1") {
          debugPrint(message);
          // await fetchWishList();
        }
      } else {
        Get.snackbar('Error', 'Failed to modify wishlist: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to modify wishlist: $e');
    } finally {
      isLoading(false);
    }
  }
}