import 'package:firstdose_user/Styles/ColorStyle.dart';
import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
// import 'package:firstdose_user/Views/Dashboard/Order/watchList.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/Profile.dart';
import 'package:flutter/material.dart';
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
        color: ColorStyle.themeColor,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(

              icon: Icon(
                Icons.home_outlined,
                color: ColorStyle.themeColor,

              ),
              label: 'Home',


            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.red,
              ),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.red,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.redAccent,
              ),
              label: 'Watchlist',
            ),
          ],
          currentIndex: widget.currentIndex,
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
        return Wishlist();
      case 4:
        return Profile();
    }
  }
}
