import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/DashBoardModel.dart';
import 'package:firstdose_user/Models/SiteSeetingModel.dart';
import 'package:firstdose_user/Utils/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Api.dart';

class DashBoardController extends GetxController {
  var isLoading = true.obs;

  var dashboardModel = DashBoardModel().obs;
  var siteSettingModel = SiteSettingModel().obs;

  sitesetting() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/site-setting');

    var body = {
      "device_details": 'device_details',
      "app_version": 'app_version',
      'device_id': 'device_id',
      'api_version': 'api_version',
      'device_type': 'android',
      'debug_mode': 'debug_mode'
    };

    try {
      final response = await http.post(url, body: body, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      var data = json.decode(response.body);
      log(response.body);
      log(body.toString());
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        // log(siteSettingData.value.data!.profile!.phoneNumber!.toString());
        debugPrint('Correct');
        siteSettingModel.value = SiteSettingModel.fromJson(data);
        siteSettingData.value = siteSettingModel.value;
        cartCountBadge.value = siteSettingModel.value.data!.cart_quantity!;
        // debugPrint(cartCountBadge.value.toString());

        log(siteSettingData.value.data!.profile!.phoneNumber!.toString());
        log(siteSettingData.value.data!.profile!.email!.toString());
      }else{
        debugPrint('Error inner');
      }
    } catch (e) {
      debugPrint('Error outer');
      debugPrint( '${e}');
    }
  }

  // RxBool processing = false.obs;

  // void siteSetting() async {
  //   // orderProcessing.value = true;
  //
  //   Map<String, dynamic> body = {
  //
  //   };
  //
  //   final response = await API.instance.post(
  //     endPoint: APIEndPoints.siteSetting,
  //     params: body,
  //     // fileParams: 'files',
  //     // file: imageList
  //   );
  //
  //   var data = jsonDecode(response.body);
  //   var status = data['status'];
  //   log(response.body);
  //   if (status == 1) {
  //     debugPrint('Site Setting');
  //   } else {}
  // }

  dashboard() async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/dashboard');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    var _isLogin = sharedPref.getBool(isLogin);
    try {
      final response = await http.post(url, body: {
        "device_details": 'device_details',
        "app_version": 'app_version',
        'device_id': 'device_id',
        'api_version': 'api_version',
        'device_type': 'android',
        'debug_mode': 'debug_mode'
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      // if (response.statusCode == 200) {
      //   setState(() {
      var data = json.decode(response.body);
      log(response.body);
      // debugPrint(ApiToken);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        // debugPrint("Api is working right");

        isLoading(false);
        debugPrint(ApiToken);
        dashboardModel.value = DashBoardModel.fromJson(data);

        // debugPrint(dashboardModel.value.data!.categories![0].name);
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to Load Data');
    }
    // });
  }
}
