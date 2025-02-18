import 'package:firstdose_user/Styles/ColorStyle.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
import 'package:firstdose_user/Views/Dashboard/Orders/Orders.dart';

// import 'package:firstdose_user/Views/Dashboard/Order/watchList.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Dashboard/Profile/WishList.dart';
import '../Dashboard/Search/SearchMedicine.dart';
import '../Dashboard/Upload/UploadPrescription.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, this.currentIndex = 0});

  int currentIndex = 0;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: Get.width,
        child: BottomNavigationBar(

          // backgroundColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: ColorStyle.themeColor,
              ),
              label: 'Home',
              backgroundColor: ColorStyle.lightthemencolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: ColorStyle.themeColor,
              ),
              label: 'Search',
              backgroundColor: ColorStyle.lightthemencolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                color: ColorStyle.themeColor,
              ),
              label: 'Upload',
              backgroundColor: ColorStyle.lightthemencolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: ColorStyle.themeColor,
              ),
              label: 'Order',
              backgroundColor: ColorStyle.lightthemencolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: ColorStyle.themeColor,
              ),
              label: 'Profile',
              backgroundColor: ColorStyle.lightthemencolor,
            ),
          ],
          currentIndex: widget.currentIndex,
          selectedItemColor: ColorStyle.black2C2C2C,
          unselectedItemColor: Colors.black,
          // unselectedItemColor: ColorStyle.black2C2C2C,
          onTap: (index) {
            widget.currentIndex = index;
            setState(() {});
          },
        ),
      ),
      body: _openPage(index: widget.currentIndex),
    );
  }

  _openPage({required int index}) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchMedicine();
      case 2:
        return UploadPrescription();
      case 3:
        return Orders();
      case 4:
        return Profile();
    }
  }
}
