import 'package:firstdose_user/Styles/ColorStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Styles/CustomTextStyles.dart';
import '../../../Styles/ImageStyle.dart';
import '../../NavigationBar/NavigationBar.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldbgcolor,
      appBar: CustomAppBar(
        appbarTitle: 'WishList',
        isLeading: true,
        isCartIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => listContainer(index: index, ),
            ),
          ),
        ),
      ),
    );
  }
}

listContainer({required int index, }) {
  return InkWell(
    onTap: () {},
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageStyle.multiVitamin,
            height: 65,
            width: 65,

          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Multivitamins',
                    style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '₹ 30',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorStyle.blackcolor),
                  ),
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: () {
                      Get.to(() => BottomNavBar());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorStyle.themeColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      child: Text(
                        'Add to cart',
                        style:
                            CustomTextStyles.poppinsMediumWhite(fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            flex: 5,
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
}
