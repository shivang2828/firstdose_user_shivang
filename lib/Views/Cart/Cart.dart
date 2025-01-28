
import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/FInalAmount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../NavigationBar/NavigationBar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final controller = Get.put(MyCartController());

  List<String> nameOfContainer = ['a', 'b', 'c', 'd', 'e'];
  var h = Get.height;

  @override
  void initState() {
    controller.myCart();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appbarTitle: ' MyCart',
          isCartIcon: false,
          isLeading: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: nameOfContainer.length,
                    itemBuilder: (context, index) =>
                        listContainer(index: index, data: nameOfContainer),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customContainer(name: 'Apply Coupen'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summery',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          paymentSummery(
                              name: 'Delivery partner fee', price: 40),
                          paymentSummery(name: 'Coupon discount', price: -40),
                          paymentSummery(name: 'GST', price: 15),
                          paymentSummery(name: 'Grand Total', price: 130),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: h * 0.1,
                  // ),
                  SizedBox(
                      width: Get.width,
                      height: 56,
                      child: button(name: 'Cheackout'),


                  ),
                  // SizedBox(
                  //   height: h * 0.1,
                  // ),
                ],
              ),
            ),
          ),
        ));
  }

  listContainer({required int index, required List data}) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageStyle.multiVitamin,
              height: 65,
              width: 65,
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
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
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  data.removeAt(index);
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.delete,
                    color: ColorStyle.greycolor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customContainer({
  required String name,
}) {
  return Container(
      margin: const EdgeInsets.only(top: 2),
      width: double.infinity,
      height: 56,
      child: TextFormField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(10.0), // Adjust padding if necessary
            //   // child: Image.asset(
            //   //   imageName,
            //   //   height: 24,
            //   //   width: 24,
            //   //   color: ColorStyle.themeColor,
            //   // ),
            // ),
            hintText: name,
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: ColorStyle.themeColor,
            ),
            fillColor: ColorStyle.whitecolor,
            filled: true,
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorStyle.themeColor, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    decoration: BoxDecoration(
                      color: ColorStyle.themeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Apply Coupon',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )),
              ),
            )),
      ));
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

Widget button({required String name}) {
  return ElevatedButton(
    onPressed: () {
      Get.to(() => FinalAmount());
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorStyle.themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Button border radius
      ),
    ),
    child: Text(
      name,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Text color
      ),
    ),
  );
}
