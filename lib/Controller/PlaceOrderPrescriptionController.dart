import 'dart:convert';
import 'dart:io';

import 'package:firstdose_user/Views/Cart/ThankYouScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/AddressModel.dart';
import '../Utils/Api.dart';

class PrepPlaceOrderController extends GetxController {
  RxBool processing = false.obs;
  RxBool orderProcessing = false.obs;

  var addressModel = AddressModel().obs;

  RxInt selectedAddress = 0.obs;

  void uploadPrep({String message = '', required List<File> imageList}) async {
    // orderProcessing.value = true;

    Map<String, dynamic> body = {
      'message': message,
      "address_id":
          addressModel.value.data![selectedAddress.value].id.toString()
    };

    final response = await API.instance.multipleImages(
        endPoint: APIEndPoints.uploadPrescription,
        params: body,
        fileParams: 'files',
        file: imageList);

    var data = jsonDecode(response.body);
    var status = data['status'];

    if (status == 1) {
      Get.offAll(ThankYouScreen());
    } else {}
  }
}
