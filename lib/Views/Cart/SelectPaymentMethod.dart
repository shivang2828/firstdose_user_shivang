import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Styles/ColorStyle.dart';
import 'FInalAmount.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  final controller = Get.put(MyCartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.myCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Final Amount',
        isLeading: true,
        isCartIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a payment method ',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Container(
            //   width: Get.width,
            //   // child: Text(
            //   //   'Total Amount'
            //   //
            //   //
            //   // ),
            //   child: Column(
            //     children: [
            //       paymentSummery(
            //           name: 'Subtotal',
            //           price: "${controller.model.value.data!.cartSubTotal}"),
            //       paymentSummery(name: 'Delivery partner fee', price: "40"),
            //       paymentSummery(
            //           name: 'Coupon discount',
            //           price:
            //               "${controller.model.value.data!.couponDiscountAmount}"),
            //       paymentSummery(name: 'GST', price: "15"),
            //       paymentSummery(
            //           name: 'Grand Total',
            //           price: "${controller.model.value.data!.cartTotal}"),
            //     ],
            //   ),
            // ),
            // Container(
            //   // color: ColorStyle.whitecolor,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     // border: Border.all(color: ColorStyle.whitecolor, width: 1),
            //     color: ColorStyle.whitecolor,
            //   ),
            //   height: 160,
            //   width: Get.width,
            //   child: Padding(
            //     padding: EdgeInsets.all(8),
            //     child: Column(
            //       children: [
            //         paymentSummery(
            //             name: 'Subtotal',
            //             price: "${controller.model.value.data!.cartSubTotal}"),
            //         paymentSummery(name: 'Delivery partner fee', price: "40"),
            //         paymentSummery(
            //             name: 'Coupon discount',
            //             price:
            //                 "${controller.model.value.data!.couponDiscountAmount}"),
            //         paymentSummery(name: 'GST', price: "15"),
            //         paymentSummery(
            //             name: 'Grand Total',
            //             price: "${controller.model.value.data!.cartTotal}"),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget paymentSummery({required String name, required String price}) {
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
}
