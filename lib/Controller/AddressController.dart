// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:firstdose_user/Models/AddressModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Utils/Const.dart';
//
// class AddressController extends GetxController {
//   var model = AddressModel().obs;
//   var selectedAddress = 0.obs;
//   var isLoading = true.obs;
//
//   addressController() async {
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//     Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/addresses');
//
//     try {
//       final response = await http.post(url, body: {
//         // flags = 'all', 'add', 'edit', 'remove'
//
//         // flag = add
//         "flag": "all",
//         "name": "Ankush Ghar",
//         "phone_number": 9649134510.toString(),
//         "country": "India",
//         "state": "Rajasthan",
//         "city": "Jaipur",
//         "pin_code": 302018.toString(),
//         "latitude": "26.8910323",
//         "longitude": "75.8327512",
//         "full_address": "test",
//         "address_type": '0', // address_type 0 for, home 1 for work
//         // not required
//         "landmark": "near Durgapura Railway Station"
//       }, headers: {
//         "Authorization": 'Bearer $ApiToken',
//       });
//
//       var data = json.decode(response.body);
//       log(response.body);
//       var status = data['status'].toString();
//       var message = data['message'].toString();
//
//       if (status == '1') {
//         model.value = AddressModel.fromJson(data);
//         isLoading(false);
//
//         debugPrint('Address Added ');
//       } else if (status == '0') {
//       } else {}
//     } catch (e) {
//       debugPrint('Error: $e');
//     }
//   }
//
//   addNewAddress(String name, String phoneNumber, String fullAddress,
//       String landmark, String city, String state) async {
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//     Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/addresses');
//
//     try {
//       final response = await http.post(url, body: {
//         // flags = 'all', 'add', 'edit', 'remove'
//
//         // flag = add
//         "flag": "all",
//         "name": name,
//         "phone_number": 9649134510.toString(),
//         "country": "India",
//         "state": "Rajasthan",
//         "city": "Jaipur",
//         "pin_code": 302018.toString(),
//         "latitude": "26.8910323",
//         "longitude": "75.8327512",
//         "full_address": "test",
//         "address_type": '0', // address_type 0 for, home 1 for work
//         // not required
//         "landmark": "near Durgapura Railway Station"
//       }, headers: {
//         "Authorization": 'Bearer $ApiToken',
//       });
//
//       var data = json.decode(response.body);
//       log(response.body);
//       var status = data['status'].toString();
//       var message = data['message'].toString();
//
//       if (status == '1') {
//         model.value = AddressModel.fromJson(data);
//         isLoading(false);
//
//         debugPrint('Address Added ');
//       } else if (status == '0') {
//       } else {}
//     } catch (e) {
//       debugPrint('Error: $e');
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/AddressModel.dart';
import '../Utils/Const.dart';

class AddressController extends GetxController {

  var model = AddressModel().obs;

  var selectedAddress = 0.obs;

  var isLoading = true.obs;


  Future<void> addressController() async {
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

        model.value = AddressModel.fromJson(data);
      }
    } catch (e) {
      debugPrint('Error fetching addresses: $e');
    } finally {
      isLoading(false);
    }
  }


  Future<void> addNewAddress(
      String name,
      String phoneNumber,
      String fullAddress,
      String landmark,
      String city,
      String state,
      String pinCode,
      ) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/addresses');

    try {
      final response = await http.post(url, body: {
        "flag": "add",
        "name": name,
        "phone_number": phoneNumber,
        "country": "India",
        "state": state,
        "city": city,
        "pin_code": pinCode,
        "latitude": "26.8910323",
        "longitude": "75.8327512",
        "full_address": fullAddress,
        "address_type": '0',
        "landmark": landmark,
      }, headers: {
        "Authorization": 'Bearer $ApiToken',
      });

      var data = json.decode(response.body);
      log(response.body);
      var status = data['status'].toString();

      if (status == '1') {

        model.value = AddressModel.fromJson(data);
      }
    } catch (e) {
      debugPrint('Error adding address: $e');
    }
  }
}
