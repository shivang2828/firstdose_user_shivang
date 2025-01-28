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




  myCart() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/add-to-cart');


    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken=sharedPref.getString(apiToken);


    final response = await http.post(url, body:{

      "product_id": 1.toString(),
      "quantity": 1.toString(),
      "device_id": "KEY_DEVICE_ID",
      "device_details": "deviceInfo",
      "app_version": "100",
      "api_version": "1",
      "device_type": "android",
      "debug_mode": "true"
    }, headers: {

      "Authorization" : 'Bearer $ApiToken',
    });

    // log(ApiToken!);

    try {
      var data = jsonDecode(response.body);
      log(response.body);
      var status = data['status'];

      if (status == 1) {

        model.value = MyCartModel.fromJson(data);
        debugPrint(model.value.data!.cartTotal);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
