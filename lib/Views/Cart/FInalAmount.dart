import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../NavigationBar/NavigationBar.dart';

class FinalAmount extends StatefulWidget {
  const FinalAmount({super.key});

  @override
  State<FinalAmount> createState() => _FinalAmountState();
}

class _FinalAmountState extends State<FinalAmount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Final Amount',
        isCartIcon: false,
        isLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  // color: ColorStyle.whitecolor,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: ColorStyle.whitecolor, width: 1),
                    color: ColorStyle.whitecolor,
                  ),
                  height: 160,
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        paymentSummery(name: 'Subtotal', price: 119),
                        paymentSummery(name: 'Delivery partner fee', price: 40),
                        paymentSummery(name: 'Coupon discount', price: -40),
                        paymentSummery(name: 'GST', price: 15),
                        paymentSummery(name: 'Grand Total', price: 130),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select a Delivery Address',
                      style: CustomTextStyles.poppinsMediumBlack(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Add new address',
                        style:
                            CustomTextStyles.poppinsRegularTheme(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
















Widget paymentSummery({required String name, required int price}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      Spacer(),
      Text(
        price.toString(),
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
