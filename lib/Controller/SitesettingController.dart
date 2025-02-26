import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firstdose_user/Views/Cart/ThankYouScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/AddressModel.dart';
import '../Utils/Api.dart';

class SiteSettingController extends GetxController {
  RxBool processing = false.obs;


  void siteSetting() async {
    // orderProcessing.value = true;

    Map<String, dynamic> body = {

    };

    final response = await API.instance.post(
        endPoint: APIEndPoints.siteSetting,
        params: body,
        // fileParams: 'files',
        // file: imageList
    );

    var data = jsonDecode(response.body);
    var status = data['status'];
    log(response.body);
    if (status == 1) {
      debugPrint('Site Setting');
    } else {}
  }
}
