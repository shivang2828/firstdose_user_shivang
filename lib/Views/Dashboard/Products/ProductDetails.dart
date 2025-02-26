import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Controller/ProductDetailController.dart';
import 'package:firstdose_user/Data/AppButton.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Importing the SpinKit package

import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = Get.put(ProductDetailController());

  // final MyCartController myCartController = Get.put(MyCartController());
  var h = Get.height;
  late String productID;

  static String stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }

  @override
  // void initState() {
  //   super.initState();
  //   controller.productdetails();
  // }
  void initState() {
    super.initState();

    final Map<String, dynamic> args = Get.arguments;
    productID = args['productID'];

    controller.productdetails(productID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: "Product Details",
        isCartIcon: true,
        isLeading: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorStyle.themeColor,
            ),
          );
        } else {
          // if (controller.productdetailModel.value.data!.products!.isEmpty ) {
          //   return Center(child: Text("No product details available"));
          // }

          var product = controller.productdetailModel.value.data!.products![0];
          var images = product.images ?? [];
          // final addCartController = Get.put(MyCartController());

          return Padding(
            padding: EdgeInsets.all(8),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Slideshow
                  if (images.isNotEmpty)
                    Container(
                      child: ImageSlideshow(
                        indicatorColor: ColorStyle.themeColor,
                        width: Get.width,
                        height: h * 0.3,
                        // height: 56,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: images.map((Url) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                Url,
                                fit: BoxFit.cover,
                              )
                              // : Image.asset(imageUrl, fit: BoxFit.cover),
                              );
                        }).toList(),
                      ),
                    ),
                  SizedBox(
                    height: 16,
                  ),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      width: Get.width,
                      // height: h * 0.5,
                      decoration: BoxDecoration(
                        color: ColorStyle.whitecolor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${product.name}',
                                    // maxLines: 2,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '₹${product.price}',
                                      style: TextStyle(
                                          decoration: (double.tryParse(product
                                                      .price
                                                      .toString()) !=
                                                  double.tryParse(product
                                                      .discountedPrice!
                                                      .toString()))
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: ColorStyle.themeColor),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    (double.tryParse(
                                                product.price!.toString()) !=
                                            double.tryParse(product
                                                .discountedPrice
                                                .toString()))
                                        ? Text(
                                            '₹${product.discountedPrice}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: ColorStyle.themeColor),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          if (controller.count.value == 0) {
                                            Get.snackbar(
                                                "", "Value Cant be less than 0",
                                                colorText:
                                                    ColorStyle.black2C2C2C,
                                                backgroundColor:
                                                    ColorStyle.themeColor,
                                                margin: EdgeInsets.all(8));
                                          } else {
                                            controller.count.value--;
                                            // await addCartController.updateCart(
                                            //     flag: 'minus',
                                            //     productId:
                                            //         product.id.toString(),
                                            //     quantity: controller.count.value
                                            //         .toString());
                                          }
                                          // controller.count.value--;
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color:
                                                      ColorStyle.themeColor)),
                                          child: Icon(
                                            Icons.remove,
                                            color: ColorStyle.themeColor,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => Text(
                                          controller.count.value.toString(),
                                          style: CustomTextStyles
                                              .poppinsMediumBlack(fontSize: 16),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (controller.count.value > 9) {
                                            Get.snackbar("",
                                                "You can add maximum only 10 item at a time",
                                                colorText:
                                                    ColorStyle.black2C2C2C,
                                                backgroundColor:
                                                    ColorStyle.themeColor,
                                                margin: EdgeInsets.all(8));
                                          } else {
                                            controller.count.value++;
                                          }
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color:
                                                      ColorStyle.themeColor)),
                                          child: Icon(
                                            Icons.add,
                                            color: ColorStyle.themeColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Category Name :- ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${product.category!.name}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyle.grey7E8494),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Salt Composition :- ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  product.saltComposition == null
                                      ? ' '
                                      : '${product.saltComposition}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyle.grey7E8494),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Drug Interactions:- ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  product.drugInteractions == null
                                      ? ' '
                                      : '${product.drugInteractions}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyle.grey7E8494),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Side effects:- ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  product.sideEffects == null
                                      ? ' '
                                      : '${product.sideEffects}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyle.grey7E8494),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              product.description == null
                                  ? ''
                                  : stripHtml('${product.description}'),
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                              ),
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 9,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () async {
                      // if (product.cart_quantity != 0) {
                      //   debugPrint('error0');
                      //   if (controller.count.value > 1) {
                      //     await controller.updateCart();
                      //
                      //     debugPrint('error1');
                      //   } else {
                      //     debugPrint('error2');
                      //     await controller.addToCart(product.id.toString(),
                      //         controller.count.value.toString());
                      //   }
                      // } else {
                      //   debugPrint('error4');
                      //   await controller.addToCart(product.id.toString(),
                      //       controller.count.value.toString());
                      // }
                      if (controller.count.value != 0) {
                        if (controller.productdetailModel.value.data!
                                .products![0].cartQuantity.value !=
                            0) {
                          controller.updateCart();
                        } else {
                          controller.addToCart();
                        }
                      } else {
                        Get.snackbar('Alert', 'Please select quantity',
                            colorText: Colors.white,
                            backgroundColor: ColorStyle.themeColor);
                      }
                    },
                    child: AppButton(
                      buttoncolor: controller.count.value == 0 ||
                              controller.buttonProcessing[productID] == true
                          ? ColorStyle.greyD9D9D9
                          : ColorStyle.themeColor,
                      buttonfontcolor: ColorStyle.whitecolor,
                      buttontext: controller.buttonProcessing[productID] == true
                          ? 'Processing'
                          : 'Add to Cart',
                    ),
                  ),

                  // Container(
                  //   width: Get.width,
                  //   height: 56,
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       if (product.cartQuantity != 0) {
                  //         if (controller.count.value > 1) {
                  //           // await addCartController.updateCart(
                  //           //     flag: 'plus',
                  //           //     productId: product.id.toString(),
                  //           //     quantity: controller.count.value.toString());
                  //
                  //         } else {
                  //           await controller.addToCart(product.id.toString(),
                  //               controller.count.value.toString());
                  //         }
                  //       } else {
                  //         await controller.addToCart(product.id.toString(),
                  //             controller.count.value.toString());
                  //       }
                  //
                  //       // Get.snackbar('Success', 'Product added to cart');
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: controller.count.value == 0
                  //           ? ColorStyle.greyD9D9D9
                  //           : ColorStyle.themeColor,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius:
                  //             BorderRadius.circular(12), // Button border radius
                  //       ),
                  //     ),
                  //     child: Text(
                  //       "Add To Cart",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white, // Text color
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
