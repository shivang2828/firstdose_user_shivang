import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/DashBoardModel.dart';
import 'package:firstdose_user/Models/SiteSeetingModel.dart';
import 'package:firstdose_user/Utils/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardController extends GetxController {

  var isLoading = true.obs;

  var dashboardModel = DashBoardModel().obs;
  var siteSettingModel = SiteSeetingModel().obs;

  sitesetting() async {
    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/site-setting');

    try {
      final response = await http.post(url, body: {
        "device_details": 'device_details',
        "app_version": 'app_version',
        'device_id': 'device_id',
        'api_version': 'api_version',
        'device_type': 'android',
        'debug_mode': 'debug_mode'
      }, headers: {});

      var data = json.decode(response.body);
      log(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
      } else if (status == 0) {
      } else {}
    } catch (e) {}
  }

  dashboard() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/dashboard');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken=sharedPref.getString(apiToken);
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
      // debugPrint(ApiToken);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {

         isLoading(false);
        dashboardModel.value = DashBoardModel.fromJson(data);

        debugPrint(dashboardModel.value.data!.categories![0].name);
      } else if (status == 0) {
      } else {}
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to Send OTP. Please try again.');
    }
    // });
  }
}
