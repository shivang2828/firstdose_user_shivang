import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstdose_user/Utils/Const.dart';
import '../Models/MyCartModel.dart';
import 'package:http/http.dart' as http;

//
// class MyCartController extends GetxController {
//   var model = MyCartModel().obs;
//
//   var isLoading = true.obs;
//
//   myCart() async {
//     Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/get-carts');
//
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//
//     final response = await http.post(url, body: {
//       "device_details": "device_details",
//       "api_version": "api_version",
//       "app_version": "app_version",
//       "device_type": "android",
//       "device_id": "device_id"
//     }, headers: {
//       "Authorization": 'Bearer $ApiToken',
//     });
//
//     // log(ApiToken!);
//
//     try {
//       var data = jsonDecode(response.body);
//       log(response.body);
//       var status = data['status'];
//
//       if (status == 1) {
//         isLoading(false);
//
//         model.value = MyCartModel.fromJson(data);
//         debugPrint(model.value.data!.cartTotal);
//       } else if (status == 0) {
//         isLoading(false);
//         Get.snackbar("Already", "Look like this product already available in your cart");
//       } else {
//         Get.snackbar("Error", "Data is not loadding correctly");
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//
//   addToMyCart( String productId) async {
//     {
//       Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/add-to-cart');
//       SharedPreferences sharedPref = await SharedPreferences.getInstance();
//       var ApiToken = sharedPref.getString(apiToken);
//
//       isLoading(true); // Start loading
//
//       try {
//         final response = await http.post(
//           url,
//           body: {
//             // "cart_items": {
//             //     "product_id": "3",
//             //     "quantity": "2"
//             // },
//             "product_id": productId,
//             "quantity": "1",
//             "device_id": "device_id",
//             "device_details": "deviceInfo",
//             "app_version": "app_version",
//             "api_version": "api_version",
//             "device_type": "android",
//             "debug_mode": "true"
//           },
//           headers: {"Authorization": 'Bearer $ApiToken'},
//         );
//
//         var data = json.decode(response.body);
//         log(response.body);
//
//         var status = data['status'];
//         var message = data['message'];
//
//         if (status == 1) {
//           debugPrint(message);
//           // await myCart();
//         }else if(status == 0){
//           Get.snackbar("This product is already available in the cart", "");
//         }else{}
//       } catch (e) {
//         debugPrint('Error: $e');
//         Get.snackbar('Error', 'Failed to modify cart: $e');
//       } finally {
//         isLoading(false);
//       }
//     }
//
//
//
//   }
//
//   clearCart(String cartId){
//     modifyCart('', cartId, "clear_cart");
//   }
//
//   removeProduct(String productId,String cartId) async{
//     await modifyCart(productId, cartId, "remove_product");
//   }
//
//   updateCart(String productId,String cartId,String quantity ) async {
//     Uri url =
//     Uri.parse('https://kbdevs.com/firstdose/api/users/v1/update-cart');
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//
//     isLoading(true); // Start loading
//
//     try {
//       final response = await http.post(
//         url,
//         body: {
//           "flag": "plus",
//           "product_id": productId.toString(),
//
//           "cart_id": cartId,
//           // flag must be plus, minus, remove_product, clear_cart
//           // send_data_flag must be 'all', 'other'
//
//           "send_data_flag": "all",
//
//           // in case of plus or minus, remove_product
//           "quantity": quantity,
//           // "product_id": 2,
//           "device_details": "device_details",
//           "api_version": "api_version",
//           "app_version": "app_version",
//           "device_type": "android",
//           "device_id": "device_id"
//         },
//         headers: {"Authorization": 'Bearer $ApiToken'},
//       );
//
//       var data = json.decode(response.body);
//       log(response.body);
//
//       var status = data['status'];
//       var message = data['message'];
//
//       if (status == "1") {
//         debugPrint(message);
//         // await myCart();
//       }
//     } catch (e) {
//       debugPrint('Error: $e');
//       Get.snackbar('Error', 'Failed to modify wishlist: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//
//
//
//
//   modifyCart(String productId, String cartId, String flag, ) async {
//     Uri url =
//         Uri.parse('https://kbdevs.com/firstdose/api/users/v1/update-cart');
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     var ApiToken = sharedPref.getString(apiToken);
//
//     isLoading(true); // Start loading
//
//     try {
//       final response = await http.post(
//         url,
//         body: {
//           "flag": flag,
//           "product_id": productId.toString(),
//
//           "cart_id": cartId,
//           // flag must be plus, minus, remove_product, clear_cart
//           // send_data_flag must be 'all', 'other'
//
//           "send_data_flag": "all",
//
//           // in case of plus or minus, remove_product
//           "quantity": "1",
//           // "product_id": 2,
//           "device_details": "device_details",
//           "api_version": "api_version",
//           "app_version": "app_version",
//           "device_type": "android",
//           "device_id": "device_id"
//         },
//         headers: {"Authorization": 'Bearer $ApiToken'},
//       );
//
//       var data = json.decode(response.body);
//       log(response.body);
//
//       var status = data['status'];
//       var message = data['message'];
//
//       if (status == "1") {
//         debugPrint(message);
//         // await myCart();
//       }
//     } catch (e) {
//       debugPrint('Error: $e');
//       Get.snackbar('Error', 'Failed to modify wishlist: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

class MyCartController extends GetxController {
  RxBool processing = false.obs;
  RxBool buttonProcessing = false.obs;





  var model = MyCartModel().obs;



  myCart() async {
    processing.value = true;

    Map<String, dynamic> body = {};

    Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/get-carts');

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    final response = await http.post(url, body: {
      "device_details": "device_details",
      "api_version": "api_version",
      "app_version": "app_version",
      "device_type": "android",
      "device_id": "device_id"
    }, headers: {
      "Authorization": 'Bearer $ApiToken',
    });

    try {
      var data = jsonDecode(response.body);
      var status = data['status'];
      log(response.body);
      if (status == 1) {
        processing.value = false;
        model.value = MyCartModel.fromJson(data);

        debugPrint('${url}');
        debugPrint('${ApiToken}');
      } else {
        processing.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  addToCart(String productId,) async {
   // RxBool buttonProcessing = true.obs;


    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);
    Map<String, dynamic> params ={
      "product_id": productId,
      "quantity": "1",
    };

    try{
      Uri url = Uri.parse('https://kbdevs.com/firstdose/api/users/v1/add-to-cart');
      final response = await http.post(url, body: params,
          // {
          //   "product_id": productId,
          //   "quantity": quntity,
          // },
          headers: {
            "Authorization": 'Bearer $ApiToken',
          }
      );

      var data = jsonDecode(response.body);
      var status = data['status'];

      log(response.body);
      if (status == 1) {
        debugPrint('${url}');
        debugPrint('${ApiToken}');
        debugPrint('${params}');
        buttonProcessing(true);


      } else if (status == 0) {

      }
    }catch(e){
      debugPrint("${e}");
    }finally{
      buttonProcessing(false);
    }

  }

  updateCart(
      {required String flag,
      required String productId,
      required String quantity}) async {
    Map<String, dynamic> body = {};

    if (flag == 'clear_cart') {
      body = {
        'cart_id': model.value.data!.id!.toString(),
        'flag': 'clear_cart',
        "send_data_flag": 'all'
      };
    } else {
      if (int.parse(quantity) != 0) {
        if (flag == 'plus' || flag == 'minus') {
          body = {
            'cart_id': model.value.data!.id!.toString(),
            'flag': flag,
            "product_id": productId,
            'quantity': quantity,
            "send_data_flag": 'all'
          };
        } else if (flag == 'remove_product') {
          body = {
            'cart_id': model.value.data!.id!.toString(),
            'flag': 'remove_product',
            "product_id": productId,
            "send_data_flag": 'all'
          };
        }
      } else {
        body = {
          'cart_id': model.value.data!.id!.toString(),
          'flag': 'remove_product',
          "product_id": productId,
          "send_data_flag": 'all'
        };
      }
    }

    Uri url =
        Uri.parse('https://kbdevs.com/firstdose/api/users/v1/update-cart');
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var ApiToken = sharedPref.getString(apiToken);

    final response = await http.post(
      url,
      body: body,
      headers: {"Authorization": 'Bearer $ApiToken'},
    );

    var data = jsonDecode(response.body);
    var status = data['status'];
    log(response.body);

    if (status == 1) {
      model.value = MyCartModel.fromJson(data);
      debugPrint('${url}');
      debugPrint('${ApiToken}');
      debugPrint('${body}');
    }
  }
}
