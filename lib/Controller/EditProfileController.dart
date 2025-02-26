import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/SiteSeetingModel.dart';
import '../Utils/Api.dart';
import '../Utils/Const.dart';

class EditProfileController extends GetxController {
  RxBool processing = false.obs;
  var siteSettingModel = SiteSettingModel().obs;
  // var siteSettingData = SiteSettingModel().obs;

  final nameTextFieldController = TextEditingController().obs;
  final emailTextFieldController = TextEditingController().obs;
  final mobileTextFieldController = TextEditingController().obs;

  updateProfile() async {
    processing.value = true;
    Map<String, dynamic> body = {
      "name": nameTextFieldController.value.text,
      "email": emailTextFieldController.value.text,
    };



    try {

        final response = await API.instance.post(
            endPoint: APIEndPoints.updateProfile, params: body, isHeader: true);

        var data = jsonDecode(response.body);
        var status = data['status'];

        if (status == 1) {
          Get.back();
          siteSetting();
          processing.value = false;
        } else {
          processing.value = false;
        }

    } catch (e) {
      debugPrint('${e}');
    }
  }

  void siteSetting() async {
    Map<String, dynamic> body = {};

    final response = await API.instance
        .post(endPoint: APIEndPoints.siteSetting, params: body, isHeader: true);

    var data = jsonDecode(response.body);
    var status = data['status'];

    try {
      if (status == 1) {
        debugPrint('corect');
        siteSettingModel.value = SiteSettingModel.fromJson(data);
        siteSettingData.value = siteSettingModel.value;

      } else {}
    } catch (e) {
      debugPrint( '${e}');
    }
  }
}
