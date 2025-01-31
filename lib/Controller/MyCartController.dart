import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstdose_user/Utils/Const.dart';
import '../Models/MyCartModel.dart';
import 'package:http/http.dart' as http;

class MyCartController extends GetxController {
  var model = MyCartModel().obs;

  var isLoading = true.obs;

  myCart() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/get-carts');

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    final response = await http.post(url, body: {
      "device_details": "device_details",
      "api_version": "api_version",
      "app_version": "app_version",
      "device_type": "android",
      "device_id": "device_id"
    }, headers: {
      "Authorization": 'Bearer $ApiToken',
    });

    // log(ApiToken!);

    try {
      var data = jsonDecode(response.body);
      log(response.body);
      var status = data['status'];

      if (status == 1) {
        isLoading(false);

        model.value = MyCartModel.fromJson(data);
        debugPrint(model.value.data!.cartTotal);
      } else if (status == 0) {
        isLoading(false);
      } else {
        Get.snackbar("Error", "Data is not loadding correctly");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  addToMyCart( String productId) async {
    {
      Uri url =
      Uri.parse('https://kbdevs.com/firstdose/api/users/v1/add-to-cart');
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      var ApiToken = sharedPref.getString(apiToken);

      isLoading(true); // Start loading

      try {
        final response = await http.post(
          url,
          body: {
            // "cart_items": {
            //     "product_id": "3",
            //     "quantity": "2"
            // },
            "product_id": productId,
            "quantity": "1",
            "device_id": "device_id",
            "device_details": "deviceInfo",
            "app_version": "app_version",
            "api_version": "api_version",
            "device_type": "android",
            "debug_mode": "true"
          },
          headers: {"Authorization": 'Bearer $ApiToken'},
        );

        var data = json.decode(response.body);
        log(response.body);

        var status = data['status'];
        var message = data['message'];

        if (status == "1") {
          debugPrint(message);
          // await myCart(productId);
        }
      } catch (e) {
        debugPrint('Error: $e');
        Get.snackbar('Error', 'Failed to modify cart: $e');
      } finally {
        isLoading(false);
      }
    }



  }

  modifyCart( String productId) async {
    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/update-cart');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    isLoading(true); // Start loading

    try {
      final response = await http.post(
        url,
        body: {
          "flag": "remove_product",
          "product_id": productId.toString(),

          "cart_id": 305.toString(),
          // flag must be plus, minus, remove_product, clear_cart
          // send_data_flag must be 'all', 'other'

          "send_data_flag": "all",

          // in case of plus or minus, remove_product
          "quantity": "1",
          // "product_id": 2,
          "device_details": "device_details",
          "api_version": "api_version",
          "app_version": "app_version",
          "device_type": "android",
          "device_id": "device_id"
        },
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      var data = json.decode(response.body);
      log(response.body);

      var status = data['status'];
      var message = data['message'];

      if (status == "1") {
        debugPrint(message);
        // await myCart();
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to modify wishlist: $e');
    } finally {
      isLoading(false);
    }
  }
}
