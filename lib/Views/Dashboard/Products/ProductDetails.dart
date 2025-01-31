import 'package:firstdose_user/Controller/ProductDetailController.dart';
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: SpinKitRotatingPlain(
              color: ColorStyle.themeColor,
              size: 50.0,
            ),
          );
        } else {
          if (controller.productdetailModel.value.data!.products!.isEmpty) {
            return Center(child: Text("No product details available"));
          }

          var product = controller.productdetailModel.value.data!.products![0];
          var images = product.images ?? [];

          return Padding(
            padding: EdgeInsets.all(8),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Slideshow
                    if (images.isNotEmpty)
                      ImageSlideshow(
                        indicatorColor: ColorStyle.themeColor,
                        width: Get.width,
                        height: h * 0.4,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: images.map((Url) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                Url,
                                fit: BoxFit.cover,
                                // errorBuilder: (context, error, stackTrace) {
                                //   return Center(child: Icon(Icons.error, color: Colors.red));
                                // },
                              )
                              // : Image.asset(imageUrl, fit: BoxFit.cover),
                              );
                        }).toList(),
                      )
                    else
                      Center(
                          child: Text("No images available for this product")),
                    const SizedBox(
                      height: 16,
                    ),

                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: Get.width,
                      height: h * 0.5,
                      decoration: BoxDecoration(
                        color: ColorStyle.whitecolor,
                      ),
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
                          SizedBox(height: 8),
                          Row(
                            children: [
                              // Text(
                              //   'by ${product.description}',
                              //   style: TextStyle(
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.w400,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                '${product.price}',
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
                          Stack(
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 9,
                                '${product.description} ',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: h * 0.2),
                                child: SizedBox(
                                  width: Get.width,
                                  height: 56,
                                  child: ElevatedButton(
                                    // onPressed: () {
                                    //   // Get.to(() => Cart());
                                    // },
                                    onPressed: () {

                                      Get.to(() => Cart(), arguments: {
                                        // 'product': data[index],
                                        'productID': product.id.toString(),
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorStyle.themeColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Button border radius
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
