import 'package:firstdose_user/Views/Dashboard/Products/ProductDetails.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/WishListController.dart';
import '../../../Models/WishListModel.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Styles/ImageStyle.dart';
import '../../../Utils/Const.dart';
import '../../../Utils/CustomAppBar.dart';
import '../../Auth/loginScreen.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // final controller = Get.put(WishListController());
  final controller = Get.put(WishListController());
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
      controller.fetchWishList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldbgcolor,
      appBar: CustomAppBar(
        appbarTitle: 'WishList',
        isLeading: true,
        isCartIcon: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorStyle.themeColor,

            ),
          );
        } else {
          if ( controller.wishListModel.value.data == null || controller.wishListModel.value.data!.length == 0 ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/emptyCart.json',
                ),
                Text(
                  'Your WishList Is Empty',
                  style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
                ),
              ],
            );
          } else {
            final wishListData =
                controller.wishListModel.value.data![0].products;
            final productsItem = wishListData;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsItem!.length,
                    itemBuilder: (context, index) => listContainer(
                      data: productsItem,
                      index: index,
                      onRemove: () async {
                        await controller.removeProductFromWishList(
                            productsItem[index].id.toString());
                        controller.fetchWishList();
                      },
                    ),
                  ),
                ),
              ),
            );
          }
        }
      }),
    );
  }
}

listContainer({
  required int index,
  required List<Products> data,
  required Future<Null> Function() onRemove,
  // required Future<Null> Function() onRemove,
}) {
  return InkWell(
    onTap: () {
      Get.to(() => ProductDetails(), arguments: {
        'productID': data[index].id.toString(),
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              data[index].images ?? ImageStyle.placeHolderImage,
              height: 65,
              width: 65,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  ImageStyle.placeHolderImage,
                  height: 65,
                  width: 65,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].name ?? 'Product Name',
                  style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  '₹ ${data[index].price ?? "N/A"}',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorStyle.blackcolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.delete_forever_outlined,
                  color: ColorStyle.themeColor,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
