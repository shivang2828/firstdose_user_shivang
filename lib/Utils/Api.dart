// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/AppDiaLogs.dart';
import '../Res/Preference.dart';
import '../Views/Auth/LoginScreen.dart';
import 'Const.dart';

class API {
  API._privateConstructor();

  bool kIsStagingURL = true;
  static final API instance = API._privateConstructor();

  // static String googleMapApiKey = "AIzaSyDejM-fakMZcQwpIDjzqALTIiD_WZq_wcw";

  String get kBaseURL {
    if (kIsStagingURL) {
      return 'https://kbdevs.com/firstdose/api/users/v1/';
    } else {
      return 'https://firstdose.in/api/users/v1/';
    }
  }

  Future<Map<String, dynamic>> constParams({
    required Map<String, dynamic> body,
  }) async {
    var fcm_token = await Preference.getSharedPref(KEY_FCM_TOKEN);

    body['device_id'] = fcm_token ?? 'KEY_DEVICE_ID';
    body['device_details'] = KEY_DEVICE_INFO;
    body['app_version'] = KEY_BUILD_NUMBER;
    body['api_version'] = KEY_API_VERSION;
    if (!kIsWeb) {
      body['device_type'] = (Platform.isAndroid) ? 'android' : 'ios';
    }
    body['debug_mode'] = (kDebugMode) ? 'true' : 'false';

    return body;
  }

  String internetConnectPoorBody = 'Internet connection is poor.';
  int internetConnectPoorCode = 1111;

  int apiExceptionCode = 1112;

  Future<bool> _checkInternet() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult[0] == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult[0] == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  checkInternetSlow(http.Response response) {
    Future.delayed(const Duration(seconds: 1), () {
      if (response.statusCode == 1111) {
        Get.snackbar('Alert', 'Poor internet connection');
      }
    });
  }

  Future<http.Response> post(
      {required String endPoint,
      required Map<String, dynamic> params,
      bool isHeader = false}) async {
    if (!await _checkInternet()) {
      // customSnackbar('Internet not connected');
    }

    final url = Uri.parse(kBaseURL + endPoint);
    var token = await Preference.getSharedPref(apiToken);

    Map<String, String> header = {};
    if (isHeader) {
      header = {
        'Authorization': 'Bearer $token',
      };
    }

    var bodyNew = await constParams(body: params);

    debugPrint(bodyNew.toString());

    try {
      final response =
          await http.post(url, body: bodyNew, headers: header).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          return http.Response(
              internetConnectPoorBody, internetConnectPoorCode);
        },
      );

      print(url);
      log("header" +
          header.toString() +
          "\n" +
          "param=" +
          jsonEncode(params).toString() +
          "\n"
              "\n" +
          "statusCode=" +
          response.statusCode.toString());
      log('Response :- ${response.body}');

      checkInternetSlow(response);

      final data = json.decode(response.body);

      final status = data['status'];

      if (status == 0) {
        Appdialogs.showToast(data['message']);
      } else if (status == 2) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.clear();
        // firebaseToken;
        Get.offAll(LoginScreen());
      }

      return response;
    } catch (error) {
      debugPrint('Error is:- ${error.toString()}');

      final response = http.Response(error.toString(), apiExceptionCode);
      return response;
    }
  }

  Future<http.Response> postImage({
    required String endPoint,
    required Map<String, dynamic> params,
    required String fileParams,
    required File? file,
  }) async {
    if (!await _checkInternet()) {
      // return http.Response("", 0);
    }

    final url = Uri.parse('$kBaseURL$endPoint');
    var token = await Preference.getSharedPref(apiToken);

    // var bodyNew = await constParams(body: params);

    final request = http.MultipartRequest('POST', url);

    request.headers['Authorization'] = 'Bearer $token';

    params.forEach((key, value) {
      request.fields[key] = value;
    });

    debugPrint('Token :- $token');
    debugPrint('URL :- $url');
    debugPrint('params :- ${params.toString()}');

    try {
      if (file!.path.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath(fileParams, file.path));
      }

      final response = await request.send();

      final res = await http.Response.fromStream(response).timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          return http.Response('Internet connection is poor.', 1111);
        },
      );

      final data = json.decode(res.body);

      debugPrint('data :- ${data.toString()}');

      final status = data['status'];

      if (status == 2) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.clear();
        // firebaseToken;
        Get.offAll(LoginScreen());
      }

      return res;
    } catch (error) {
      debugPrint('Error is:- ${error.toString()}');
      final response = http.Response(error.toString(), apiExceptionCode);
      return response;
    }
  }

  Future<http.Response> multiplePostImage({
    required String endPoint,
    required Map<String, dynamic> params,
    required String fileParams,
    // required String imageParams,
    required File? file,
    // required File? image,
  }) async {
    if (!await _checkInternet()) {
      return http.Response("", 0);
    }

    final url = Uri.parse('$kBaseURL$endPoint');

    var tokenAPI = await Preference.getSharedPref(apiToken);
    // var bodyNew = await constParams(body: params);

    final request = http.MultipartRequest('POST', url);

    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = '$tokenAPI';

    params.forEach((key, value) {
      request.fields[key] = value;
    });
// image!.path.isNotEmpty
    try {
      if (file!.path.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath(fileParams, file.path));
        // request.files
        //     .add(await http.MultipartFile.fromPath(imageParams, image.path));
      }

      debugPrint('URL :- $url');
      debugPrint('params :- $params');

      final response = await request.send();

      debugPrint('${response.request.toString()}');
      debugPrint('${response.stream.toString()}');

      final res = await http.Response.fromStream(response).timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          return http.Response('Internet connection is poor.', 1111);
        },
      );

      final data = json.decode(res.body);

      final status = data['statusCode'];

      if (status == 2) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.clear();
        // firebaseToken;
        Get.offAll(LoginScreen());
      }

      return res;
    } catch (error) {
      final response = http.Response(error.toString(), apiExceptionCode);
      return response;
    }
  }

  Future<http.Response> multipleImages({
    required String endPoint,
    required Map<String, dynamic> params,
    required String fileParams,
    required List<File>? file,
  }) async {
    if (!await _checkInternet()) {
      // return http.Response("", 0);
    }

    final url = Uri.parse('$kBaseURL$endPoint');

    var tokenAPI = await Preference.getSharedPref(apiToken);

    final request = http.MultipartRequest('POST', url);

    request.headers['Authorization'] = 'Bearer $tokenAPI';

    params.forEach((key, value) {
      request.fields[key] = value;
    });

    try {
      if (file != null && file.isNotEmpty) {
        for (int i = 0; i < file.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              '$fileParams[$i]', file[i].path));
        }
      }
      for (var items in request.files) debugPrint('${items.filename}');

      debugPrint('URL :- $url');
      debugPrint('params :- $params');

      final response = await request.send();

      final res = await http.Response.fromStream(response).timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          return http.Response('Internet connection is poor.', 1111);
        },
      );

      final data = json.decode(res.body);
      debugPrint('${data}');

      final status = data['status'];

      if (status == 2) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.clear();
        // firebaseToken;
        Get.offAll(LoginScreen());
      }
      return res;
    } catch (error) {
      debugPrint(error.toString());
      final response = http.Response(error.toString(), apiExceptionCode);
      return response;
    }
  }
}

class APIEndPoints {
  static const userLogin = 'send-otp';
  static const verifyOtp = 'verify-otp/login';
  static const notifications = 'notifications';
  static const updateProfile = 'update-profile';
  static const productDetail = 'product-detail';
  static const products = 'products';
  static const getCart = 'get-carts';
  static const dashboard = 'dashboard';
  static const orders = 'orders';
  static const orderDetails = 'order-details';
  static const deleteNotification = 'delete-notification';
  static const readNotification = 'read-notification';
  static const siteSetting = 'site-setting';
  static const wishlist = 'wishlist';
  static const placeOrder = 'place-order';
  static const coupon = 'coupon';
  static const searchMedicines = 'search-medicines';
  static const categories = 'categories';
  static const addToCart = 'add-to-cart';
  static const updateCart = 'update-cart';
  static const addresses = 'addresses';
  static const deleteAccount = 'delete-account';
  static const orderAction = 'order-action';
  static const checkPaymentStatus = 'check-payment-status';
  static const uploadPrescription = 'upload-prescription';
  static const logout = 'logout';
}
