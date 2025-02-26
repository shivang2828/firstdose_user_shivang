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
  String? productCategory = Get.arguments[0];
  int? categoryID = Get.arguments[1];

  Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final controller = Get.put(ProductController());

  // late String categoryID;
  // late String productCategory;

  // late ScrollController _scrollController;
  var addedInWishList = 0.obs;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.page.value = 1;
      controller.product(widget.categoryID!.toString());
      scrollController.addListener(pagination);
    });

    super.initState();
    // controller.product(categoryID);
  }

  void pagination() {
    if (controller.productModel.value.data!.products!.length <
        controller.productModel.value.total_data!) {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        controller.page.value++;
        controller.product(widget.categoryID.toString());
      }
    }
  }

  // void pagination() {
  //
  //   if (controller.hasMore.value &&
  //       scrollController.position.maxScrollExtent ==
  //           scrollController.position.pixels) {
  //     controller.page.value++;
  //     controller.product(widget.categoryID.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: widget.productCategory,
        isLeading: true,
        // isCartIcon: true,
      ),
      body: Obx(() {
        if (controller.processing.value) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/noMedicineFound.json'),
              Text(
                'No Medicine is Available',
                style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
              ),
            ],
          );
        } else {
          return RefreshIndicator(
            onRefresh: () {
              return controller.product(
                widget.categoryID.toString(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SafeArea(
                child: listContainer(
                  data: controller.productModel.value.data!.products!,
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget listContainer({required List<ProductsListing> data}) {
    // final wishListController = Get.put(WishListController());
    // final addCartController = Get.put(MyCartController());

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: (controller.isLoadingList.value)
          ? controller.productModel.value.data!.products!.length + 1
          : controller.productModel.value.data!.products!.length,
      itemBuilder: (context, index) {
        if (index < controller.productModel.value.data!.products!.length) {
          // final addedInWishList = controller
          //     .productModel.value.data!.products![index].added_in_wishlisht
          //     .toString();
          // var addedWishlist = addedInWishList.obs;
          return InkWell(
            onTap: () {
              Get.to(() => ProductDetails(), arguments: {
                'productID': data[index].id.toString(),
              })!
                  .then(
                (value) {
                  controller.product(widget.categoryID!.toString());
                },
              );
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
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    Image.asset(ImageStyle.placeHolderImage),
                          ),
                  ),
                  const SizedBox(width: 10),

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
                                          decoration: double.tryParse(data[index].price.toString()) ==
                                                  double.tryParse(data[index].discountedPrice.toString())
                                              ? TextDecoration.none
                                              : TextDecoration.lineThrough),
                                    ),
                              data[index].discountedPrice! != 0.0
                                  // double.tryParse(data[index]
                                  //     .discountedPrice
                                  //     .toString())
                                  ? Text(
                                      '₹ ${double.tryParse(data[index].discountedPrice.toString())} ',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorStyle.blackcolor,
                                      ),
                                    ):SizedBox.shrink(),
                            ],
                          ),
                          const SizedBox(height: 6),
                          // Add to Cart Button
                          InkWell(
                            onTap: () async {
                              if (controller.productModel.value.data!
                                      .products![index].cart_quantity.value ==
                                  0) {
                                controller.addToCart(
                                  data[index].id!.toString(),
                                  index,
                                );
                              } else {
                                controller.updateCart(
                                  productId: data[index].id!.toString(),
                                  quantity:
                                      (data[index].cart_quantity.value + 1)
                                          .toString(),
                                  cartId: data[index].cart_id.toString(),
                                  index: index,
                                );
                                // data[index].id!.toString(),
                                // data[index].cart_id.toString());
                              }

                              // controller.addToCart(
                              //     data[index].id!.toString()
                              // );

                              // await addCartController.addToCart(
                              //   data[index].id.toString(),
                              // );
                            },
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  color: controller.buttonProcessing[
                                              data[index].id!.toString()] ==
                                          true
                                      ? ColorStyle.grey7E8494
                                      : ColorStyle.themeColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  controller.buttonProcessing[
                                              data[index].id!.toString()] ==
                                          true
                                      ? 'Processing'
                                      : 'Add To Cart',
                                  style: CustomTextStyles.poppinsMediumWhite(
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async {
                        if (controller.productModel.value.data!.products![index]
                                .added_in_wishlisht.value !=
                            0) {
                          await controller.modifyWishList(
                            flag: 'remove_product',
                            productId: data[index].id.toString(),
                            index: index,
                          );
                        } else {
                          await controller.modifyWishList(
                            flag: 'add',
                            productId: data[index].id.toString(),
                            index: index,
                          );
                        }

                        // controller.product(categoryID, page: 1);
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.topCenter,
                          child: Icon(
                            controller.productModel.value.data!.products![index]
                                        .added_in_wishlisht.value ==
                                    0
                                ? Icons.favorite_border_outlined
                                : Icons.favorite,
                            color: controller
                                        .productModel
                                        .value
                                        .data!
                                        .products![index]
                                        .added_in_wishlisht
                                        .value ==
                                    0
                                ? ColorStyle.blackcolor
                                : ColorStyle.themeColor,
                            // color: ColorStyle.greycolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(color: ColorStyle.themeColor));
        }
      },
    );
  }
}
