import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:firstdose/Utils/API.dart';
import 'package:firstdose_user/Views/Cart/ThankYouScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/AddressModel.dart';
import '../Utils/Api.dart';
import '../Utils/Const.dart';
import 'package:http/http.dart' as http;

class UploadPrescriptionController extends GetxController {
  RxBool processing = false.obs;
  var addressModel = AddressModel().obs;
  RxInt selectedAddress = 0.obs;
  var isLoading  = false.obs;

  var messageTextFiled = TextEditingController().obs;

  var imageList = <File>[].obs;

  void uploadPrep({required imageList, String message = ''}) async {


    Map<String, dynamic> body = {

      'message': messageTextFiled.value.text,
      "address_id": addressModel.value.data![selectedAddress.value].id.toString()
    };

    final response = await API.instance.multipleImages(
        endPoint: APIEndPoints.uploadPrescription,
        params: body,
        fileParams: 'files',
        file: imageList);

    var data = jsonDecode(response.body);
    var status = data['status'];

    if (status == 1) {
      // debugPrint(addressModel.value.data![selectedAddress.value].id.toString());
      Get.offAll(() => ThankYouScreen());
      processing.value = false;
    } else {
      // debugPrint(addressModel.value.data![selectedAddress.value].id.toString());
      processing.value = false;
    }
  }


  addressController() async {
    isLoading(true);
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/addresses');

    try {
      final response = await http.post(url, body: {
        "flag": "all",
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      var data = json.decode(response.body);
      log(response.body);
      var status = data['status'].toString();

      if (status == '1') {

        addressModel.value = AddressModel.fromJson(data);
      }
    } catch (e) {
      debugPrint('Error fetching addresses: $e');
    } finally {
      isLoading(false);
    }
  }
}
