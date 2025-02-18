// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Utils/Const.dart';
// import 'package:http/http.dart' as http;
//
// https://kbdevs.com/firstdose/api/users/v1/upload-prescription
//
//
//
//
//
// class PrescriptionController extends GetxController {
//   var isLoading = true.obs;
//
//
//
//   upload() async {
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//     Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/products');
//     try {
//       final response = await http.post(url, body: {
//         "device_details": 'device_details',
//         "app_version": 'app_version',
//         'device_id': 'device_id',
//         'message': 'Test',
//         'files[0]'
//         'address_id' : '2',
//         // "product_id": productID,
//         "is_popular": "0",
//         'api_version': 'api_version',
//         'device_type': 'android',
//         'debug_mode': 'debug_mode'
//
//       }, headers: {
//         "Authorization": 'Bearer $ApiToken',
//
//       });
//
//       // if (response.statusCode == 200) {z
//       //   setState(() {
//       var data = json.decode(response.body);
//       log(response.body);
//       log(url.toString());
//       var status = data['status'];
//       var message = data['message'];
//
//       if (status == 1) {
//         isLoading(false);
//
//
//
//
//       }
//
//       else {
//         Get.snackbar('Product added to cart', '');
//       }
//     } catch (e) {
//       debugPrint('Error: $e');
//       // Get.snackbar('Error', 'Failed to Load Data. Please try again.');
//     }
//   }
// }