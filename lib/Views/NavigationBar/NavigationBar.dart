

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/helpers/bottom_bar.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart' hide Badge;


import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Dashboard/Home/HomeScreen.dart';
import '../Dashboard/Profile/Profile.dart';
import '../Dashboard/Orders/Orders.dart';
import '../Dashboard/Search/SearchMedicine.dart';
import '../Dashboard/Upload/UploadPrescription.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, required this.selected});
  var selected = 2;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            widget.selected = 2;
            setState(() {});
          },
          child: Visibility(
            visible: MediaQuery
                .of(context)
                .viewInsets
                .bottom == 0.0,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: ColorStyle.themeColor, shape: BoxShape.circle),
              child: Center(
                  child: SvgPicture.asset(ImageStyle.camera_bottombaricon)),
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: StylishBottomBar(
          backgroundColor: ColorStyle.lightintroScreenBgcolor,
          currentIndex: widget.selected,
          fabLocation: StylishBarFabLocation.center,
          items: [
            iconBuilder(
                onTap: () {
                  widget.selected = 0;
                  setState(() {});
                },
                index: 0,
                name: 'Home',
                iconImage: ImageStyle.home_bottombaricon),
            iconBuilder(
                onTap: () {
                  widget.selected = 1;
                  setState(() {});
                },
                index: 1,
                name: 'Search',
                iconImage: ImageStyle.search_bottombaricon),
            iconBuilder(
                onTap: () {},
                index: 2,
                name: '',
                iconImage: ImageStyle.cartIconBottomBar),
            iconBuilder(
                onTap: () {
                  widget.selected = 3;
                  setState(() {});
                },
                index: 3,
                name: 'Orders',
                iconImage: ImageStyle.ordersbottombaricon),
            iconBuilder(
                onTap: () {
                  widget.selected = 4;
                  setState(() {});
                },
                index: 4,
                name: 'Profile',
                iconImage: ImageStyle.profile_bottombaricon),
          ],
          hasNotch: true,
          option: AnimatedBarOptions(),
          // opacity: 0.3,
        ),
        body: _openPage(widget.selected));
  }

  iconBuilder({
    required String iconImage,
    required String name,
    required int index,
    required Function() onTap,
  }) {
    return BottomBarItem(
        icon: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(iconImage,
                color: (widget.selected == index)
                    ? ColorStyle.themeColor
                    : ColorStyle.blackcolor)),
        title: GestureDetector(
          onTap: onTap,
          child: Text(name,
              style: CustomTextStyles.poppinsMediumCustom(
                  fontSize: 14,
                  color: (widget.selected == index)
                      ? ColorStyle.themeColor
                      : ColorStyle.blackcolor)),
        ));
  }

  _openPage(int page) {
    switch (page) {
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
