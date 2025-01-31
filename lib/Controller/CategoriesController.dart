import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/CategoriesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Const.dart';

class CategoriesController extends GetxController {


  var isLoading = true.obs;
  // var model = CategoriesModel().obs;

  var categoryModel = CategoriesModel().obs;

  category() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/categories');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    try {
      final response = await http.post(url, body: {
        "device_details": "device_details",
        "api_version": "api_version",
        "app_version": "app_version",
        "device_type": "android",
        "device_id": "device_id",
        // "category_id": 3
        "is_popular": "0"
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      var data = jsonDecode(response.body);
      log(response.body);
      var status= data['status'];

    if(status == 1){
      isLoading(false);

      categoryModel.value = CategoriesModel().toJson(data) as CategoriesModel;
    }








    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
