// import 'package:firstdose_user/Controller/MyCartController.dart';
// import 'package:firstdose_user/Utils/CustomAppBar.dart';
// import 'package:firstdose_user/Views/Cart/FInalAmount.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../Styles/ColorStyle.dart';
// import '../../Styles/CustomTextStyles.dart';
// import '../../Styles/ImageStyle.dart';
// import '../../Utils/Const.dart';
// import '../NavigationBar/NavigationBar.dart';
//
// class Cart extends StatefulWidget {
//   const Cart({super.key});
//
//   @override
//   State<Cart> createState() => _CartState();
// }
//
// class _CartState extends State<Cart> {
//   final controller = Get.put(MyCartController());
//
//
//   var h = Get.height;
//   late String productID;
//
//   @override
//   void initState() {
//     final Map<String, dynamic> args = Get.arguments;
//     productID = args['productID'];
//
//     controller.myCart(productID);
//
//
//     // controller.myCart();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar(
//         appbarTitle: ' MyCart',
//         isCartIcon: false,
//         isLeading: true,
//     )
//     ,
//     body
//     :
//     Obx
//     (
//     (
//     ) {
//     // Check if data is still loading
//     if (controller.isLoading.value) {
//     return Center(
//     child: SpinKitRotatingPlain(
//     color: ColorStyle.themeColor,
//     size: 50.0,
//     ),
//     );
//     }
//
//     else{ return Padding(
//     padding: EdgeInsets.all(16),
//     child: SingleChildScrollView(
//     child: SafeArea(
//     child: Column(
//     children: [
//     // ListView.builder(
//     //   padding: const EdgeInsets.all(8),
//     //   shrinkWrap: true,
//     //   scrollDirection: Axis.vertical,
//     //   physics: NeverScrollableScrollPhysics(),
//
//
//     controller.model.value.data == null ||
//     controller.model.value.data!.cartItem == null
//     ? Center(child: CircularProgressIndicator())
//         :
//     ListView.builder(
//     padding: const EdgeInsets.all(8),
//     shrinkWrap: true,
//     scrollDirection: Axis.vertical,
//     physics: NeverScrollableScrollPhysics(),
//     itemCount:
//     controller.model.value.data!.cartItem!.length,
//     itemBuilder: (context, index) =>
//     listContainer( data :controller.model.value.data?.cartItem ?? []),
//     ),
//     // const SizedBox(
//     //   height: 10,
//     // ),
//     // customContainer(name: 'Apply Coupen'),
//     // const SizedBox(
//     //   height: 10,
//     // ),
//     // Row(
//     //   mainAxisAlignment: MainAxisAlignment.start,
//     //   children: [
//     //     Text(
//     //       'Payment Summery',
//     //       style: GoogleFonts.poppins(
//     //         fontWeight: FontWeight.bold,
//     //         fontSize: 18,
//     //       ),
//     //     ),
//     //   ],
//     // ),
//     // const SizedBox(
//     //   height: 10,
//     // ),
//     Container(
//       // color: ColorStyle.whitecolor,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         // border: Border.all(color: ColorStyle.whitecolor, width: 1),
//         color: ColorStyle.whitecolor,
//       ),
//       height: 160,
//       width: Get.width,
//       child: Padding(
//         padding: EdgeInsets.all(8),
//         child: Column(
//           children: [
//             paymentSummery(name: 'Subtotal', price: 119),
//             paymentSummery(
//                 name: 'Delivery partner fee', price: 40),
//             paymentSummery(name: 'Coupon discount', price: -40),
//             paymentSummery(name: 'GST', price: 15),
//             paymentSummery(name: 'Grand Total', price: 130),
//           ],
//         ),
//       ),
//     ),
//     // // SizedBox(
//     // //   height: h * 0.1,
//     // // ),
//     // SizedBox(
//     //     width: Get.width,
//     //     height: 56,
//     //     child: button(name: 'Cheackout'),
//     //
//     //
//     // ),
//     // SizedBox(
//     //   height: h * 0.1,
//     // ),
//     ],
//     ),
//     ),
//     ),
//     ),
//     }
//     ),
//     );
//     }
//
//     listContainer( { required List data}) {
//     return InkWell(
//     onTap: () {},
//     child: Container(
//     alignment: Alignment.center,
//     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(10),
//     ),
//     width: Get.width,
//     child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Image.asset(
//     ImageStyle.multiVitamin,
//     height: 65,
//     width: 65,
//     ),
//     const SizedBox(width: 10),
//     Expanded(
//     flex: 5,
//     child: Container(
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     'Multivitamins',
//     style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
//     ),
//     const SizedBox(height: 5),
//     Text(
//     '₹ 30',
//     style: GoogleFonts.poppins(
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//     color: ColorStyle.blackcolor),
//     ),
//     const SizedBox(height: 6),
//     InkWell(
//     onTap: () {
//     Get.to(() => BottomNavBar());
//     },
//     child: Container(
//     decoration: BoxDecoration(
//     color: ColorStyle.themeColor,
//     borderRadius: BorderRadius.circular(5),
//     ),
//     padding:
//     EdgeInsets.symmetric(vertical: 6, horizontal: 15),
//     child: Text(
//     'Add to cart',
//     style:
//     CustomTextStyles.poppinsMediumWhite(fontSize: 10),
//     ),
//     ),
//     )
//     ],
//     ),
//     ),
//     ),
//     Expanded(
//     child: InkWell(
//     // onTap: () {
//     //   data.removeAt(index);
//     //   setState(() {});
//     // },
//     child: Container(
//     padding: EdgeInsets.symmetric(vertical: 10),
//     alignment: Alignment.topCenter,
//     child: Icon(
//     Icons.delete,
//     color: ColorStyle.greycolor,
//     ),
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     );
//     }
//   }
//
//   Widget customContainer({
//     required String name,
//   }) {
//     return Container(
//         margin: const EdgeInsets.only(top: 2),
//         width: double.infinity,
//         height: 56,
//         child: TextFormField(
//           textAlign: TextAlign.left,
//           decoration: InputDecoration(
//             // prefixIcon: Padding(
//             //   padding: const EdgeInsets.all(10.0), // Adjust padding if necessary
//             //   // child: Image.asset(
//             //   //   imageName,
//             //   //   height: 24,
//             //   //   width: 24,
//             //   //   color: ColorStyle.themeColor,
//             //   // ),
//             // ),
//               hintText: name,
//               hintStyle: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w400,
//                 color: ColorStyle.themeColor,
//               ),
//               fillColor: ColorStyle.whitecolor,
//               filled: true,
//               contentPadding: EdgeInsets.all(16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide(
//                     color: ColorStyle.themeColor, width: 0.5),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide:
//                 BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
//               ),
//               suffixIcon: Padding(
//                 padding: EdgeInsets.all(8),
//                 child: InkWell(
//                   onTap: () {},
//                   child: Container(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 12, horizontal: 18),
//                       decoration: BoxDecoration(
//                         color: ColorStyle.themeColor,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         'Apply Coupon',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontSize: 12,
//                         ),
//                       )),
//                 ),
//               )),
//         ));
//   }
//
//   Widget paymentSummery({required String name, required int price}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           name,
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         Spacer(),
//         Text(
//           price.toString(),
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget button({required String name}) {
//     return ElevatedButton(
//       onPressed: () {
//         Get.to(() => FinalAmount());
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: ColorStyle.themeColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12), // Button border radius
//         ),
//       ),
//       child: Text(
//         name,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.white, // Text color
//         ),
//       ),
//     );
//   }

import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Models/MyCartModel.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/FInalAmount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../../Utils/Const.dart';
import '../NavigationBar/NavigationBar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final controller = Get.put(MyCartController());
  var h = Get.height;
  late String productID;

  @override
  void initState() {
    final Map<String, dynamic> args = Get.arguments;
    productID = args['productID'];
    controller.addToMyCart(productID);
    controller.myCart();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'My Cart',
        isCartIcon: false,
        isLeading: true,
      ),
      body: Obx(() {
        // Check if data is still loading
        if (controller.isLoading.value) {
          return Center(
            child: SpinKitRotatingPlain(
              color: ColorStyle.themeColor,
              size: 50.0,
            ),
          );
        }
        else {
          final cartItems = controller.model.value.data!.cartItem;
          if(controller.model.value.data!.cartItem == null){
            return Center(
              child: Text(
                'No products in your cart',
                style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      controller.model.value.data == null ||
                          controller.model.value.data!.cartItem == null
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                        controller.model.value.data!.cartItem!.length,
                        itemBuilder: (context, index) => listContainer(
                          data: controller.model.value.data!.cartItem!,
                          index: index,
                          onRemove: () async {
                            await controller.modifyCart(controller.model.value.data!.cartItem![index].productId.toString());
                          },

                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customContainer(name: 'Apply Coupon'),
                      const SizedBox(height: 10),
                      Container(
                        // color: ColorStyle.whitecolor,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // border: Border.all(color: ColorStyle.whitecolor, width: 1),
                          color: ColorStyle.whitecolor,
                        ),
                        height: 160,
                        width: Get.width,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            // var cartValues = controller.model.value.data!.cartItem;
                            children: [
                              paymentSummery(
                                  name: 'Subtotal',
                                  price:
                                  "${controller.model.value.data!.cartSubTotal}"),
                              paymentSummery(
                                  name: 'Delivery partner fee', price: "40"),
                              paymentSummery(
                                  name: 'Coupon discount',
                                  price:
                                  "${controller.model.value.data!.couponDiscountAmount}"),
                              paymentSummery(name: 'GST', price: "15"),
                              paymentSummery(
                                  name: 'Grand Total',
                                  price:
                                  "${controller.model.value.data!.cartTotal}"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 56,
                        child: button(name: 'Cheackout'),
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            );


          }







        }
      }),
    );
  }

  listContainer({required List data, required int index, required Future<Null> Function() onRemove,


    // required Future<Null> Function() onRemove
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              data[index].product?.images,
              height: 65,
              width: 65,
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index].product?.name ?? 'Unknown Product',
                      style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${data[index].product?.price}',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyle.blackcolor),
                    ),
                    const SizedBox(height: 6),
                    // InkWell(
                    //   onTap: () {
                    //     Get.to(() => BottomNavBar());
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: ColorStyle.themeColor,
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                    //     child: Text(
                    //       'Add to cart',
                    //       style: CustomTextStyles.poppinsMediumWhite(fontSize: 10),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(


                onTap: onRemove,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.delete,
                    color: ColorStyle.greycolor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainer({
    required String name,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      width: double.infinity,
      height: 56,
      child: TextFormField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: name,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: ColorStyle.themeColor,
          ),
          fillColor: ColorStyle.whitecolor,
          filled: true,
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorStyle.themeColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  color: ColorStyle.themeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Apply Coupon',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentSummery({required String name, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          price.toString(),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget button({required String name}) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => FinalAmount(), arguments: {
          'Subtotal': "${controller.model.value.data!.cartSubTotal}",
          'Coupon discount':
              "${controller.model.value.data!.couponDiscountAmount}",
          'Grand Total': "${controller.model.value.data!.cartTotal}",
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyle.themeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Button border radius
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
