import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/MyCartModel.dart';
import 'package:firstdose_user/Models/ProductDetailModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Api.dart';
import '../Utils/Const.dart';

class ProductDetailController extends GetxController {
  var productdetailModel = ProductDetailModel().obs;
  var cartModel = MyCartModel().obs;

  var cartID = 0.obs;

  var isLoading = true.obs;
  var count = 0.obs;
  var buttonProcessing = <String, bool>{}.obs;

  productdetails(String productID) async {
    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/product-detail');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    buttonProcessing[productID] = true;
    buttonProcessing.refresh();
    try {
      final response = await http.post(
        url,
        body: {
          "device_details": "device_details",
          "api_version": "api_version",
          "app_version": "app_version",
          "device_type": "android",
          "device_id": "device_id",
          "product_id": productID,
        },
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      var data = jsonDecode(response.body);
      log(response.body);
      var status = data['status'];
      var message = data['message'];

      if (status == 1) {
        isLoading(false);
        productdetailModel.value = ProductDetailModel.fromJson(data);
        count.value =
            productdetailModel.value.data!.products![0].cartQuantity.value;
        debugPrint('${url}');
        // debugPrint('${ApiToken}');

        // debugPrint(productdetailModel.value.data!.products![0].description);
      } else if (status == 0) {
      } else {}
    } catch (e) {
      debugPrint('Error: $e');
      // Get.snackbar('Error', 'Failed to Send OTP. Please try again.');
    } finally {
      buttonProcessing[productID] = false;
      buttonProcessing.refresh();
    }
  }

  addToCart() async {
    // buttonProcessing.value = true;
    buttonProcessing[
    productdetailModel.value.data!.products![0].id.toString()] = true;
    buttonProcessing.refresh();

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Map<String, dynamic> params = {
      "product_id": productdetailModel.value.data!.products![0].id.toString(),
      "quantity": count.value.toString(),
    };

    try {
      Uri url =
          Uri.parse('https://kbdevs.com/firstdose/api/users/v1/add-to-cart');
      final response = await http.post(url,
          body: params,
          // {
          //   "product_id": productId,
          //   "quantity": quntity,
          // },
          headers: {
            "Authorization": 'Bearer $ApiToken',
          });

      var data = jsonDecode(response.body);
      var status = data['status'];

      log(response.body);
      if (status == 1) {
        cartCountBadge.value++;

        // debugPrint('${productdetailModel.value.data!.toString()}');

        productdetailModel.value.data!.products![0].cartQuantity.value =
            count.value;
        // productdetailModel.value.data!.products![0].cartId.value =  data['data']['cart_item'][0]['cart_id'];

        debugPrint('$url');
        debugPrint('$ApiToken');
        debugPrint('$params');
        // print("Cart ID: ${cartModel.value.data?.id.value}");
        cartID.value = data["data"]["id"];
        debugPrint("Cart ID: $cartID");
        // cartID.value = cartModel.value.data!.id.value;
        // debugPrint(cartModel.value.data!.id.value.toString());
        // debugPrint(cartID.value.toString());
      } else if (status == 0) {}
    } catch (e) {
      debugPrint("${e}");
    }finally{
      buttonProcessing[
      productdetailModel.value.data!.products![0].id.toString()] = false;
      refresh();
    }
  }

  void updateCart() async {
    // buttonProcessing.value = true;
    buttonProcessing[
        productdetailModel.value.data!.products![0].id.toString()] = true;
    buttonProcessing.refresh();

    Map<String, dynamic> body = {
      "product_id": productdetailModel.value.data!.products![0].id.toString(),
      "send_data_flag": 'other',
      "quantity": count.value.toString(),
      "flag": (productdetailModel.value.data!.products![0].cartQuantity >
              count.value)
          ? 'minus'
          : 'plus',
      "cart_id": cartID.toString(),
    };

    try {
      final response = await API.instance.post(
          endPoint: APIEndPoints.updateCart, params: body, isHeader: true);

      var data = jsonDecode(response.body);
      var status = data['status'];
      if (status == 1) {
        // buttonProcessing.value = false;
        // cartCountBadge.value++;
        // Get.to(MyCart())!.then(
        //   (value) => productDetail(
        //     productId: detailModel.value.data!.products![0].id.toString(),
        //   ),
        // );
      } else if (status == 0) {}

      // buttonProcessing.value = false;
    } catch (e) {
      debugPrint('${e}');
    }finally{
      buttonProcessing[
      productdetailModel.value.data!.products![0].id.toString()] = false;
      refresh();
    }
  }
}
