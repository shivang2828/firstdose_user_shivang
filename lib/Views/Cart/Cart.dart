import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Models/MyCartModel.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/FInalAmount.dart';
import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../../Utils/Const.dart';
import '../Auth/loginScreen.dart';
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

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    isLoggedIn = sharedPref.getBool(isLogin) ?? false;

    if (!isLoggedIn) {
      Get.offAll(() => LoginScreen());
    } else {
      controller.myCart();
    }
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
            child: CircularProgressIndicator(
              color: ColorStyle.themeColor,

            ),
          );
        } else {
          // final cartItems = controller.model.value.data!.cartItem;
          if (controller.model.value.data == null
              ||
              controller.model.value.data!.cartItem!.length == 0
          ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/emptyCart.json',
                  ),
                  Text(
                    'No products in your cart',
                    style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
                  ),
                ],
              );

          } else {
            return Padding(
              padding: EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.model.value.data!.cartItem!.length} Items In cart",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: ColorStyle.black2C2C2C,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(() => BottomNavBar());
                          },
                          child: Text(
                            " + Add more Item",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: ColorStyle.themeColor,
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
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
                                  await controller.modifyCart(
                                      controller.model.value.data!
                                          .cartItem![index].productId
                                          .toString(),
                                      controller.model.value.data!.id
                                          .toString());

                                  controller.myCart();
                                },
                              ),
                            ),
                            customContainer(name: 'Apply Coupon'),
                            const SizedBox(height: 20),
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
                                            "₹${controller.model.value.data!.cartSubTotal}"),
                                    paymentSummery(
                                        name: 'Delivery partner fee',
                                        price: "₹40"),
                                    paymentSummery(
                                        name: 'Coupon discount',
                                        price:
                                            "₹${controller.model.value.data!.couponDiscountAmount}"),
                                    paymentSummery(name: 'GST', price: "₹15"),
                                    paymentSummery(
                                        name: 'Grand Total',
                                        price:
                                            "₹${controller.model.value.data!.cartTotal}"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),

                    Container(
                      // padding: EdgeInsets.only(bottom: 25),
                      width: Get.width,
                      height: 56,
                      child: button(name: 'Checkout'),
                    ),
                    // SizedBox(
                    //   height: h * 0.1,
                    // ),
                  ],
                ),
              ),
            );
          }
        }
      }),
    );
  }

  listContainer({
    required List data,
    required int index,
    required Future<Null> Function() onRemove,

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
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  data[index].product?.images,
                  height: 65,
                  width: 65,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              // Expanded(
              //   flex: 5,
              //   child: Container(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           data[index].product?.name ?? 'Unknown Product',
              //           style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
              //         ),
              //         const SizedBox(height: 5),
              //         Text(
              //           '₹${data[index].product?.price}',
              //           style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: ColorStyle.themeColor,
              //           ),
              //         ),
              //         const SizedBox(height: 6),
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 8,
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
                      '₹${data[index].product?.price}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorStyle.themeColor,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onRemove,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      ImageStyle.delete,
                      height: 45,
                      // width: 15,
                      // color: ColorStyle.greycolor,
                    ),
                    // child: Icon(
                    //   Icons.delete,
                    // )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customContainer({
    required String name,
  }) {
    final cartValue = controller.model.value.data!;
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

  paymentSummery({required String name, required String price}) {
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

  button({required String name}) {
    return ElevatedButton(
      onPressed: () {
        Get.to(
          () => FinalAmount(
            subtotal: controller.model.value.data!.cartSubTotal.toString(),
            grandtotal: controller.model.value.data!.cartTotal.toString(),
          ),
        );
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
