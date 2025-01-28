import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/AddressModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Const.dart';

class AddressController extends GetxController {

  var model = AddressModel().obs;
  var selectedAddress = 0.obs;
  var isLoading = true.obs;



  addressController() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken=sharedPref.getString(apiToken);
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/addresses');

    try {
      final response = await http.post(url, body: {
        // flags = 'all', 'add', 'edit', 'remove'

        // flag = add
        "flag": "add",
        "name": "Ankush Ghar",
        "phone_number": 9649134510.toString(),
        "country": "India",
        "state": "Rajasthan",
        "city": "Jaipur",
        "pin_code": 302018.toString(),
        "latitude": "26.8910323",
        "longitude": "75.8327512",
        "full_address": "test",
        "address_type": '0', // address_type 0 for, home 1 for work
        // not required
        "landmark": "near Durgapura Railway Station"
      }, headers: {
        "Authorization" : 'Bearer $ApiToken',
      });

      var data = json.decode(response.body);
      log(response.body);
      var status = data['status'].toString();
      var message = data['message'].toString();

      if (status == '1') {


        model.value= AddressModel.fromJson(data);
        isLoading(false);

        debugPrint('Address Added ');
      } else if (status == '0') {
      } else {}
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
