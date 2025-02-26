
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
import '../../../Utils/Const.dart';

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
    controller.sitesetting();
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
          Obx(
            () => IconButton(
              onPressed: () {
                Get.to(() => Cart());
              },
              icon: Badge(
                isLabelVisible: true,
                backgroundColor: (cartCountBadge.value == 0)
                    ? Colors.transparent
                    : ColorStyle.themeColor,
                label: (cartCountBadge.value == 0)
                    ? SizedBox.shrink()
                    : Text(cartCountBadge.value.toString()),
                child: Icon(Icons.shopping_cart),
              ),
              color: ColorStyle.blackcolor,
            ),
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: ColorStyle.blackcolor,
          //   ),
          //   onPressed: () {
          //     Get.to(() => Cart());
          //   },
          // ),
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
                      // onTap: () {
                      //   Get.to(() => SearchMedicine());
                      // },
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
                // childAspectRatio: 2
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(
                    () => Product(),
                    arguments: [
                      data[index].name,
                      data[index].id,
                    ],
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
