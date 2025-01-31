import 'package:firstdose_user/Controller/HomeScreenController.dart';
import 'package:firstdose_user/Views/Dashboard/Products/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Models/DashBoardModel.dart';
import '../../../Styles/ColorStyle.dart';

// import '../Styles/ColorStyle.dart';

import '../../../Styles/CustomTextStyles.dart';
// Assuming you have a ColorStyle class for colors

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DashBoardController());

  @override
  void initState() {
    super.initState();
    controller.sitesetting();
    controller.dashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () {
          if (controller.isLoading.value) {

            return Center(
              child: SpinKitRotatingPlain(
                color: ColorStyle.themeColor,
                size: 50.0,
              ),
            );
          } else {
            // Show the actual content when data is fetched
            return Padding(
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
                      const SizedBox(height: 20),
                      _buildGrid(data: controller.dashboardModel.value.data!.categories!),
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

              Get.to(() => Product(), arguments: {
                'product': data[index],
                'productID': data[index].id.toString()


              });
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

  const CustomSearchBar({super.key, 
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
