
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/ProductController.dart';
import '../../../Models/ProductModel.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Utils/CustomAppBar.dart';
import 'ProductDetails.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}


class _ProductState extends State<Product> {
  final controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    controller.product();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'All Products',
        isLeading: true,
        isCartIcon: true,
      ),
      body: Obx(
            () {
          // Check if data is still loading
          if (controller.isLoading.value) {
            return Center(
              child: SpinKitRotatingPlain(
                color: ColorStyle.themeColor,
                size: 50.0,
              ),
            );
          } else {
            // Show product data once loaded
            return Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      listContainer(
                        data: controller.productModel.value.data!.products!,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // List Container for displaying the products
  listContainer({required List<Products> data}) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigate to ProductDetails
            Get.to(() => ProductDetails(), arguments: data[index]);
          },
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
                  data[index].images!,
                  height: 65,
                  width: 65,
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].name!,
                        style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '₹ ${data[index].price}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyle.blackcolor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorStyle.themeColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                          child: Text(
                            'Add to cart',
                            style: CustomTextStyles.poppinsMediumWhite(fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.favorite,
                        color: ColorStyle.themeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

