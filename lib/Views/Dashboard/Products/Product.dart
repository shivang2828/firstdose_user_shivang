import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstdose_user/Controller/CategoriesController.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../Controller/MyCartController.dart';
import '../../../Controller/ProductController.dart';
import '../../../Controller/WishListController.dart';
import '../../../Models/ProductModel.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Utils/CustomAppBar.dart';
import '../Profile/WishList.dart';
import 'ProductDetails.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final controller = Get.put(ProductController());
  late String categoryID;
  late String productCategory;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments;
    categoryID = args['categoryID'];
    productCategory = args['productCategory'];
    _scrollController = ScrollController()..addListener(_scrollListener);
    controller.product(categoryID, page: 1);

    // controller.product(categoryID);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      controller.loadNextPage(categoryID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: productCategory,
        isLeading: true,
        isCartIcon: true,
      ),
      body: Obx(() {
        // Check if data is still loading
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorStyle.themeColor,
            ),
          );
        } else if (controller.productModel.value.data == null ||
            controller.productModel.value.data!.products == null ||
            controller.productModel.value.data!.products!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/noMedicineFound.json'),
              Text(
                'No Medicine is Available',
                style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
              ),
            ],
          );
        } else {

          return Padding(
            padding: const EdgeInsets.all(8),
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
      }),
    );
  }

  Widget listContainer({required List<Products> data}) {
    final wishListController = Get.put(WishListController());
    final addCartController = Get.put(MyCartController());

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (index >= data.length) {
          return controller.isLoadMore.value
              ? Center(
                  child:
                      CircularProgressIndicator(color: ColorStyle.themeColor))
              : SizedBox.shrink();
        }
        final addedInWishList = controller
            .productModel.value.data!.products![index].addedInWishlisht
            .toString();
        return InkWell(
          onTap: () {
            Get.to(() => ProductDetails(), arguments: {
              'productID': data[index].id.toString(),
            });
          },
          child: Container(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Expanded(
                  flex: 2,
                  child: (data[index].images == null ||
                          data[index].images!.isEmpty)
                      ? Image.asset(ImageStyle.placeHolderImage)
                      : CachedNetworkImage(
                          height: 80,
                          width: 100,
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                          imageUrl: data[index].images!,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Image.asset(ImageStyle.placeHolderImage),
                        ),
                ),
                const SizedBox(width: 10),
                // Product Details
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].name!,
                          style: CustomTextStyles.poppinsRegularBlack(
                              fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '₹ ${data[index].price} ',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorStyle.blackcolor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Add to Cart Button
                        InkWell(
                          onTap: () async {
                            await addCartController.addToCart(
                              data[index].id.toString(),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorStyle.themeColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 15,
                            ),
                            child: Text(
                              addCartController.buttonProcessing.value
                                  ? 'Add to cart'
                                  : 'Processing',
                              style: CustomTextStyles.poppinsMediumWhite(
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Wishlist Icon
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      await wishListController
                          .addToWishList(data[index].id.toString());
                      controller.product(categoryID, page: 1);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.favorite,
                        color: addedInWishList != '0'
                            ? ColorStyle.themeColor
                            : ColorStyle.greycolor,
                        // color: ColorStyle.greycolor,
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
