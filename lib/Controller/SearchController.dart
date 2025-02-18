
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/SearchMedicineModel.dart';
import '../utils/const.dart';

class SearchMedicineController extends GetxController {
  var isLoading = false.obs;
  var hasSearched = false.obs;
  var errorMessage = ''.obs;
  var model = SearchMedicineModel().obs;
  TextEditingController textController = TextEditingController();

  Future<void> searchMedicine(String searchKeyword) async {
    isLoading.value = true;
    hasSearched.value = true;
    errorMessage.value = '';

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var _apiToken = sharedPref.getString(apiToken);

    if (_apiToken == null) {
      errorMessage.value = 'Authentication token not found';
      isLoading.value = false;
      return;
    }

    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/search-medicines');
    try {
      final response = await http.post(
        url,
        body: {
          "device_details": "device_details",
          "api_version": "1",
          "app_version": "app_version",
          "device_type": "android",
          "device_id": "device_id",
          "search_keyword": searchKeyword,
        },
        headers: {
          "Authorization": 'Bearer $_apiToken',
        },
      );

      log('Response: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var status = data['status'];
        var message = data['message'];

        if (status == 1) {
          model.value = SearchMedicineModel.fromJson(data);
          hasSearched(true);
        } else {
          errorMessage.value = message;
        }
      } else {
        errorMessage.value = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: ${e.toString()}';
      log('Error: $e');
    } finally {
      isLoading.value = false;
      // hasSearched.value =false;
    }
  }
}