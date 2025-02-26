import 'dart:convert';
import 'dart:developer';

import 'package:firstdose_user/Models/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Api.dart';
import '../Utils/Const.dart';

class ProductController extends GetxController {
  var page = 1.obs;

  // var buttonProcessing = false.obs;
  var buttonProcessing = <String, bool>{}.obs;

  var productModel = ProductModel().obs;
  var processing = false.obs;
  var isLoadingList = false.obs;

  product(String categoryId) async {
    isLoadingList.value = (this.page == 1) ? false : true;
    processing.value = (this.page == 1) ? true : false;

    Map<String, dynamic> body = {
      'category_id': categoryId,
      "page": page.value.toString()
    };

    final response = await API.instance
        .post(endPoint: APIEndPoints.products, params: body, isHeader: true);

    try {
      var data = jsonDecode(response.body);
      var status = data['status'];

      if (status == 1) {
        processing.value = false;
        if (this.page.value == 1) {
          processing.value = false;
          productModel.value = ProductModel.fromJson(data);
        } else {
          isLoadingList.value = true;
          processing.value = false;
          final newModelData = ProductModel.fromJson(data);
          productModel.value.data!.products =
              productModel.value.data!.products! + newModelData.data!.products!;
          isLoadingList.value = false;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      processing.value = false;
    }
  }

  addToCart(String productId, int index) async {
    buttonProcessing[productId] = true;
    buttonProcessing.refresh();

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Map<String, dynamic> params = {
      "product_id": productId,
      "quantity": "1",
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
        productModel.value.data!.products![index].cart_quantity.value++;
        productModel.value.data!.products![index].cart_id.value =
            data['data']['cart_item'][0]['cart_id'];
        debugPrint('${url}');
        debugPrint('${ApiToken}');
        debugPrint('${params}');
      } else if (status == 0) {}
    } catch (e) {
      debugPrint("${e}");
    } finally {
      buttonProcessing[productId] = false;
      buttonProcessing.refresh();
    }
  }

  updateCart({
    required String productId,
    required String quantity,
    required String cartId,
    required int index,
  }) async {
    // buttonProcessing.value = true;
    buttonProcessing[productId] = true;
    buttonProcessing.refresh();

    Map<String, dynamic> body = {
      "product_id": productId,
      "send_data_flag": 'other',
      "quantity": quantity,
      "flag": 'plus',
      "cart_id": cartId,
    };

    try {
      final response = await API.instance.post(
          endPoint: APIEndPoints.updateCart, params: body, isHeader: true);

      var data = jsonDecode(response.body);
      var status = data['status'];
      if (status == 1) {
        productModel.value.data!.products![index].cart_id.value =
            data['data']['cart_item'][0]['cart_id'];
        productModel.value.data!.products![index].cart_quantity.value++;

        // buttonProcessing.value = false;
        // cartCountBadge.value++;
        // Get.to(MyCart())!.then(
        //   (value) => productDetail(
        //     productId: detailModel.value.data!.products![0].id.toString(),
        //   ),
        // );
      } else if (status == 0) {
        // buttonProcessing.value = false;
      }
    } catch (e) {
      debugPrint('${e}');
    } finally {
      buttonProcessing[productId] = false;
      buttonProcessing.refresh();
    }
  }

  // addToWishList(String productId) async {
  //   await _modifyWishList("add", productId);
  // }
  //
  // removeProductFromWishList(String productId) async {
  //   await _modifyWishList("remove_product", productId);
  // }

  modifyWishList(
      {required String flag,
      required String productId,
      required int index}) async {
    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/wishlist');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    try {
      final response = await http.post(
        url,
        body: {"flag": flag, "product_id": productId.toString()},
        headers: {"Authorization": 'Bearer $ApiToken'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        log(response.body);
        log(url.toString());
        log(flag.toString());
        log(productId.toString());

        var status = data['status'];
        var message = data['message'];

        if (status == 1) {
          if (flag == 'add') {
            productModel.value.data!.products![index].added_in_wishlisht.value =
                1;
          } else {
            productModel.value.data!.products![index].added_in_wishlisht.value =
                0;
          }

          debugPrint(message);
        }
      } else {
        Get.snackbar('Products already added to the wishlist', '');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Failed to modify wishlist: $e');
    }
  }
}
