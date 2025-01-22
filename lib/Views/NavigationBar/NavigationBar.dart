import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
import 'package:firstdose_user/Views/Dashboard/Order/watchList.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Dashboard/Search/Search.dart';
import '../Dashboard/Upload/Search.dart';

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
        color: Colors.red,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              label: 'Home', // Optional label for the Home button
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              label: 'Search', // Optional label for the Search button
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.red,
              ),
              label: 'Profile', // Optional label for the Profile button
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.red,
              ),
              label: 'Profile', // Optional label for the Profile button
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
            // You can handle the navigation here based on the selected index
            // print('Selected index: $index');
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
        return Watchlist();
      case 3:
        return UploadImage();
      case 4:
        return Profile();
    }
  }
}
