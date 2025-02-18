// import 'package:firstdose_user/Controller/HomeScreenController.dart';
// import 'package:firstdose_user/Styles/ImageStyle.dart';
// import 'package:firstdose_user/Views/Dashboard/Home/AllCategory.dart';
// import 'package:firstdose_user/Views/Dashboard/Products/Product.dart';
// import 'package:firstdose_user/Views/Dashboard/Search/SearchMedicine.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../Models/DashBoardModel.dart';
// import '../../../Styles/ColorStyle.dart';
//
// // import '../Styles/ColorStyle.dart';
//
// import '../../../Styles/CustomTextStyles.dart';
// // Assuming you have a ColorStyle class for colors
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final controller = Get.put(DashBoardController());
//
//   @override
//   void initState() {
//     super.initState();
//     controller.sitesetting();
//     controller.dashboard();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   surfaceTintColor: Colors.transparent,
//       //   backgroundColor: ColorStyle.whitecolor,
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   title: Image.asset(
//       //     ImageStyle.appLogoIconPNG,
//       //   ),
//       // ),
//       body: Obx(
//         () {
//           if (controller.isLoading.value) {
//             return Center(
//               child: SpinKitRotatingPlain(
//                 color: ColorStyle.themeColor,
//                 size: 50.0,
//               ),
//             );
//           } else {
//             // Show the actual content when data is fetched
//             return Padding(
//               padding: const EdgeInsets.all(15),
//               child: SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/appLogoIconPNG.png',
//                           height: 30,
//                           width: 200,
//                         ),
//                         // IconButton(
//                         //   // onPressed: onTap,
//                         //   icon: Icon(
//                         //     Icons.add_shopping_cart,
//                         //     size: 20,
//                         //   ),
//                         //   color: ColorStyle.blackcolor,
//                         //   onPressed: () {},
//                         // )
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => SearchMedicine());
//                       },
//                       child: IgnorePointer(
//                         child: CustomSearchBar(
//                           leading: const Icon(Icons.search, color: Colors.grey),
//                           hintText: "Search medicines..",
//                           hintStyle: GoogleFonts.poppins(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey,
//                             height: 1.5,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // ImageSlideshow(
//                     //   indicatorColor: Colors.blue,
//                     //   width: Get.width,
//                     //   autoPlayInterval: 3000,
//                     //   isLoop: true,
//                     //   children: [
//                     //     ClipRRect(
//                     //       borderRadius: BorderRadius.circular(10),
//                     //       clipBehavior: Clip.antiAlias,
//                     //       child: Image.asset(
//                     //         'assets/images/image1.jpg',
//                     //         fit: BoxFit.cover,
//                     //       ),
//                     //     ),
//                     //     ClipRRect(
//                     //       borderRadius: BorderRadius.circular(10),
//                     //       clipBehavior: Clip.antiAlias,
//                     //       child: Image.asset(
//                     //         'assets/images/image1.jpg',
//                     //         fit: BoxFit.cover,
//                     //       ),
//                     //     ),
//                     //     ClipRRect(
//                     //       borderRadius: BorderRadius.circular(10),
//                     //       clipBehavior: Clip.antiAlias,
//                     //       child: Image.asset(
//                     //         'assets/images/image1.jpg',
//                     //         fit: BoxFit.cover,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     const SizedBox(height: 20),
//                     ShopCategory(),
//                     const SizedBox(height: 20),
//                     _buildGrid(
//                         data:
//                             controller.dashboardModel.value.data!.categories!),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   _buildGrid({required List<Categories> data}) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: GridView.builder(
//               // physics: NeverScrollableScrollPhysics(),
//               // physics: AlwaysScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 20,
//               ),
//               itemBuilder: (context, index) => InkWell(
//                 onTap: () {
//                   Get.to(
//                     () => Product(),
//                     arguments: {
//                       // 'product': data[index],
//                       'categoryID': data[index].id.toString(),
//                        'productCategory': data[index].name.toString()
//                     },
//                     // transition: Transition.circularReveal,
//                     // duration: Duration(seconds: 3),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(
//                           data[index].image!,
//                           height: 60,
//                         )),
//                     Flexible(
//                       child: Text(
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         data[index].name!,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.poppinsBoldBlack(fontSize: 13),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               itemCount: data.length,
//               primary: false,
//               // shrinkWrap: false,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class CustomSearchBar extends StatelessWidget {
//   final Widget leading;
//   final String hintText;
//   final TextStyle hintStyle;
//
//   const CustomSearchBar({
//     super.key,
//     required this.leading,
//     required this.hintText,
//     required this.hintStyle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         suffixIcon: leading,
//         hintText: hintText,
//         hintStyle: hintStyle,
//         filled: true,
//         fillColor: Colors.white,
//         // border: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(12),
//         //
//         // ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       ),
//     );
//   }
// }
//
// class ShopCategory extends StatelessWidget {
//   const ShopCategory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 0.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Shop By Category",
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Get.to(() => AllCategory());
//             },
//             child: Text(
//               "See All",
//               style: GoogleFonts.poppins(
//                 color: ColorStyle.themeColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firstdose_user/Controller/HomeScreenController.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Views/Cart/Cart.dart';
import 'package:firstdose_user/Views/Dashboard/Home/AllCategory.dart';
import 'package:firstdose_user/Views/Dashboard/Products/Product.dart';
import 'package:firstdose_user/Views/Dashboard/Search/SearchMedicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Models/DashBoardModel.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DashBoardController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller.dashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorStyle.whitecolor,
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.shopping_cart,
        //     color: ColorStyle.blackcolor,
        //   ),
        //   onPressed: () {
        //
        //   },
        // ),
        title: Image.asset(
          ImageStyle.appLogoIconPNG,
          height: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: ColorStyle.blackcolor,
            ),
            onPressed: () {
              Get.to(() => Cart());
            },
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.themeColor,

              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Get.to(() => SearchMedicine());
                      },
                      child: IgnorePointer(
                        child: CustomSearchBar(
                          leading: const Icon(Icons.search, color: Colors.grey),
                          hintText: "Search medicines..",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    ShopCategory(),
                    const SizedBox(height: 20),
                    _buildGrid(
                        data:
                            controller.dashboardModel.value.data!.categories!),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  _buildGrid({required List<Categories> data}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(
                    () => Product(),
                    arguments: {
                      'categoryID': data[index].id.toString(),
                      'productCategory': data[index].name.toString(),
                    },
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data[index].image!,
                          height: 60,
                        )),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        data[index].name!,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.poppinsBoldBlack(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: data.length,
              primary: false,
            ),
          )
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  final Widget leading;
  final String hintText;
  final TextStyle hintStyle;

  const CustomSearchBar({
    super.key,
    required this.leading,
    required this.hintText,
    required this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: leading,
        hintText: hintText,
        hintStyle: hintStyle,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}

class ShopCategory extends StatelessWidget {
  const ShopCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shop By Category",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => AllCategory());
            },
            child: Text(
              "See All",
              style: GoogleFonts.poppins(
                color: ColorStyle.themeColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
