import 'package:firstdose_user/Controller/dashBoardController.dart';
import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:firstdose_user/Views/Auth/otpScreen.dart';
import 'package:firstdose_user/Views/Dashboard/Products/Product.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/Profile.dart';
import 'package:firstdose_user/Views/Dashboard/Upload/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Models/DashBoardModel.dart';
import '../../../Styles/ColorStyle.dart';

// import '../Styles/ColorStyle.dart';
import 'package:flutter/src/rendering/box.dart';

import '../../../Styles/CustomTextStyles.dart';
import '../../../Styles/ImageStyle.dart';
import '../Profile/WishList.dart';
import '../Search/Search.dart'; // Assuming you have a ColorStyle class for colors

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DashBoardController());

  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    // ProfileScreen(),
    // SettingsScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    controller.sitesetting();
    controller.dashboard();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/appLogoIconPNG.png',
                        height: 30,
                        width: 200,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                        
                  CustomSearchBar(
                    leading: const Icon(Icons.search, color: Colors.grey),
                    hintText: "Search medicines..",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ImageSlideshow(
                    indicatorColor: Colors.blue,
                    width: Get.width,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/image1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/image1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/image1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ShopCategory(),
                  // BottomNavigation(),
                  const SizedBox(height: 20),
                        
                  _buildGrid(
                      data: controller.dashboardModel.value.data!.categories!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildGrid({required List<Categories> data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(Product());
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
          itemCount: controller.dashboardModel.value.data!.categories!.length,
          shrinkWrap: true,
        )
      ],
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  final Widget leading;
  final String hintText;
  final TextStyle hintStyle;

  CustomSearchBar({
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
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //
        // ),
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

// class gridBuilder extends StatelessWidget {
//   late final int itemCount; // Accepts the dynamic number of items
//
//   gridBuilder(
//       {required this.itemCount}); // Constructor to pass the dynamic item count
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       crossAxisSpacing: 12,
//       crossAxisCount: 3, // 3 items per row
//
//       children: [
//         Column(
//           children: [
//             ListView.builder(
//               padding: const EdgeInsets.all(8),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 5,
//               itemBuilder: (context, index) =>
//                   _buildGrid(data:  .value.data, );
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 'assets/images/skincare.png',
//                 height: 50,
//               ),
//             ),
//             Flexible(
//               child: Text(
//                 'SkinCare ', // Dynamically show item name with index
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontSize: 13,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class ShopCategory extends StatelessWidget {
  const ShopCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.0),
      child: Text(
        "Shop By Category",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
