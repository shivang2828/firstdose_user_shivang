
import 'package:firstdose_user/Views/Cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/CustomTextStyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
        required this.appbarTitle,
        this.isLeading = false,
        this.onTap,
        this.isCartIcon = true});



  final appbarTitle;
  bool isLeading = false;
  bool isCartIcon = true;
  Function()? onTap;
  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorStyle.whitecolor,
        centerTitle: true,
        elevation: 0,
        actions: [
          (isCartIcon)
              ? InkWell(
               onTap: (){
                 Get.to(()  => Cart());
               },
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: IconButton(
                    onPressed: onTap,
                    icon: Icon(
                        Icons.shopping_cart,
                        color: ColorStyle.blackcolor,


                    ),
                    color: ColorStyle.blackcolor,
                  ),
                ),
              )
              : SizedBox.shrink(),
        ],
        leading: (isLeading)
            ? InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorStyle.greycolor,
          ),
        )
            : SizedBox.shrink(),
        title: Text(
          appbarTitle,
          style: CustomTextStyles.poppinsSemiBoldBlack(fontSize: 21),
        ));
  }
}




