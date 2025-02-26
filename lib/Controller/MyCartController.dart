import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/MyCartModel.dart';
import '../Utils/Const.dart';

class MyCartController extends GetxController {
  RxBool processing = false.obs;
  RxBool buttonProcessing = false.obs;

  var model = MyCartModel().obs;

  myCart() async {
    processing.value = true;

    Map<String, dynamic> body = {};

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

    try {
      var data = jsonDecode(response.body);
      var status = data['status'];
      log(response.body);
      if (status == 1) {
        processing.value = false;
        model.value = MyCartModel.fromJson(data);

        debugPrint('${url}');
        debugPrint('${ApiToken}');
      } else {
        processing.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  updateCart(
      {required String flag,
      required String productId,
      required String quantity}) async {
    Map<String, dynamic> body = {};

    if (flag == 'clear_cart') {
      body = {
        'cart_id': model.value.data!.id!.toString(),
        'flag': 'clear_cart',
        "send_data_flag": 'all'
      };
    } else {
      if (int.parse(quantity) != 0) {
        if (flag == 'plus' || flag == 'minus') {
          body = {
            'cart_id': model.value.data!.id!.toString(),
            'flag': flag,
            "product_id": productId,
            'quantity': quantity,
            "send_data_flag": 'all'
          };
        } else if (flag == 'remove_product') {
          body = {
            'cart_id': model.value.data!.id!.toString(),
            'flag': 'remove_product',
            "product_id": productId,
            "send_data_flag": 'all'
          };
        }
      } else {
        body = {
          'cart_id': model.value.data!.id!.toString(),
          'flag': 'remove_product',
          "product_id": productId,
          "send_data_flag": 'all'
        };
      }
    }

    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/update-cart');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    final response = await http.post(
      url,
      body: body,
      headers: {"Authorization": 'Bearer $ApiToken'},
    );

    var data = jsonDecode(response.body);
    var status = data['status'];
    log(response.body);

    if (status == 1) {

      if(flag == 'clear_cart'){
        cartCountBadge.value =0;
      }
      if(flag == 'remove_product' ){
        cartCountBadge.value--;
      }

      model.value = MyCartModel.fromJson(data);
      debugPrint('${url}');
      debugPrint('${ApiToken}');
      debugPrint('${body}');
    }
  }
}
