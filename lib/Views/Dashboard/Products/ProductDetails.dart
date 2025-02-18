import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Controller/ProductDetailController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Importing the SpinKit package

import '../../../Styles/ColorStyle.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = Get.put(ProductDetailController());
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
          if (controller.productdetailModel.value.data!.products!.isEmpty) {
            return Center(child: Text("No product details available"));
          }

          var product = controller.productdetailModel.value.data!.products![0];
          var images = product.images ?? [];
          final addCartController = Get.put(MyCartController());

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
                              children: [
                                Text(
                                  '₹${product.price}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorStyle.themeColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 9,
                              stripHtml('${product.description}'),
                              // '${product.description} ',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () async {
                        await addCartController
                            .addToMyCart(product.id.toString());
                        Get.snackbar('Success', 'Product added to cart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyle.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Button border radius
                        ),
                      ),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),
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
