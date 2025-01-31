// import 'package:firstdose_user/Controller/WishListController.dart';
// import 'package:firstdose_user/Models/WishListModel.dart';
// import 'package:firstdose_user/Styles/ColorStyle.dart';
// import 'package:firstdose_user/Utils/CustomAppBar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../Styles/CustomTextStyles.dart';
// import '../../../Styles/ImageStyle.dart';
// import '../../NavigationBar/NavigationBar.dart';
//
// class Wishlist extends StatefulWidget {
//   const Wishlist({super.key});
//
//   @override
//   State<Wishlist> createState() => _WishlistState();
// }
//
// class _WishlistState extends State<Wishlist> {
//   final controller = Get.put(WishListController());
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller.fetchWishList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorStyle.scaffoldbgcolor,
//       appBar: CustomAppBar(
//         appbarTitle: 'WishList',
//         isLeading: false,
//         isCartIcon: true,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(
//             child: SpinKitRotatingPlain(
//               color: ColorStyle.themeColor,
//               size: 50.0,
//             ),
//           );
//         } else {
//           return Padding(
//             padding: EdgeInsets.all(16),
//             child: SingleChildScrollView(
//               child: SafeArea(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.all(8),
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount:
//                       controller.wishListModel.value.data!.products!.length,
//                   itemBuilder: (context, index) => listContainer(
//                     data : controller.wishListModel.value.data!.products!,
//                     index: index,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       }),
//       // body: Obx(() {
//       //   if (controller.isLoading.value) {
//       //     return Center(
//       //       child: SpinKitRotatingPlain(
//       //         color: ColorStyle.themeColor,
//       //         size: 50.0,
//       //       ),
//       //     );
//       //   } else {
//       //     final products = controller.wishListModel.value.data!.products ;
//       //     if (products!.isEmpty) {
//       //       return Center(child: Text('No products in your wishlist'));
//       //     }
//       //     else{
//       //       return Padding(
//       //         padding: EdgeInsets.all(16),
//       //         child: SingleChildScrollView(
//       //           child: SafeArea(
//       //             child: ListView.builder(
//       //               padding: const EdgeInsets.all(8),
//       //               shrinkWrap: true,
//       //               scrollDirection: Axis.vertical,
//       //               physics: NeverScrollableScrollPhysics(),
//       //               itemCount: products.length,
//       //               itemBuilder: (context, index) => listContainer(
//       //                 data: products,
//       //                 index: index,
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //       );
//       //     }
//       //
//       //   }
//       // }),
//
//     );
//   }
// }
//
// listContainer({
//   required int index, required List<Products> data,
// }) {
//   return InkWell(
//     onTap: () {},
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//       margin: EdgeInsets.symmetric(
//         vertical: 10,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: Get.width,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(
//             data[index].images!,
//             // ImageStyle.multiVitamin,
//             height: 65,
//             width: 65,
//           ),
//
//
//           const SizedBox(width: 10),
//           Expanded(
//             flex: 5,
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${data[index].name}',
//                     style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
//                   ),
//                   const SizedBox(height: 5),
//
//                   Text(
//                     '₹ ${data[index].price ?? "N/A"}',
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: ColorStyle.blackcolor,
//                     ),
//                   ),
//
//                   const SizedBox(height: 6),
//                   // InkWell(
//                   //   onTap: () {
//                   //     Get.to(() => BottomNavBar());
//                   //   },
//                   //   child: Container(
//                   //     decoration: BoxDecoration(
//                   //       color: ColorStyle.themeColor,
//                   //       borderRadius: BorderRadius.circular(5),
//                   //     ),
//                   //     padding:
//                   //         EdgeInsets.symmetric(vertical: 6, horizontal: 15),
//                   //     child: Text(
//                   //       'Add to cart',
//                   //       style:
//                   //           CustomTextStyles.poppinsMediumWhite(fontSize: 10),
//                   //     ),
//                   //   ),
//                   // )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 data.removeAt(index);
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 alignment: Alignment.topCenter,
//                 child: Icon(
//                   Icons.favorite,
//                   color: ColorStyle.themeColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }








import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/WishListController.dart';
import '../../../Models/WishListModel.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Styles/ImageStyle.dart';
import '../../../Utils/CustomAppBar.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final controller = Get.put(WishListController());

  @override
  void initState() {
    super.initState();
    controller.fetchWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldbgcolor,
      appBar: CustomAppBar(
        appbarTitle: 'WishList',
        isLeading: false,
        isCartIcon: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: SpinKitRotatingPlain(
              color: ColorStyle.themeColor,
              size: 50.0,
            ),
          );
        } else {
          final products = controller.wishListModel.value.data?.products;
          if (controller.wishListModel.value.data?.products == null) {
            return Center(
              child: Text(
                'No products in your wishlist',
                style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
              ),
            );
          }


          else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => listContainer(
                      data: controller.wishListModel.value.data!.products!,
                      index: index,
                      // onRemove: () async {
                      //   await controller.removeProductFromWishList(
                      //       products[index].id.toString());
                      // },
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
  // required Future<Null> Function() onRemove,
}) {
  return InkWell(
    onTap: () {},
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
              // onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
}
