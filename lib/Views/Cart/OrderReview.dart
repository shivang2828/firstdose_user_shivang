// import 'package:firstdose_user/Controller/MyCartController.dart';
// import 'package:firstdose_user/Styles/ImageStyle.dart';
// import 'package:firstdose_user/Utils/CustomAppBar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../Controller/AddressController.dart';
// import '../../Styles/ColorStyle.dart';
// import '../../Styles/CustomTextStyles.dart';
// import 'FinalAmount.dart';
//
// class OrderReview extends StatefulWidget {
//   const OrderReview({super.key, required this.indexNum});
//
//   final int indexNum;
//
//   @override
//   State<OrderReview> createState() => _OrderReviewState();
// }
//
// class _OrderReviewState extends State<OrderReview> {
//   // final controller = Get.put(MyCartController());
//   final MyCartController myCartController = Get.put(MyCartController());
//   final AddressController controller = Get.put(AddressController());
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // controller.myCart();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         appbarTitle: 'Order Review',
//         isLeading: true,
//         isCartIcon: false,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Payment Summery ',
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             listPaymentContainer(),
//             const SizedBox(
//               height: 15,
//             ),
//             Text(
//               'Payment Method ',
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             radioListTile()
//           ],
//         ),
//       ),
//     );
//   }
//
//   listPaymentContainer() {
//     var payment = myCartController.model.value.data!.payments!;
//     return Container(
//       // padding: EdgeInsets.symmetric(horizontal: 10),
//       // width: Get.width,
//       alignment: Alignment.center,
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: Get.width,
//       height: 100,
//
//       child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: payment.length,
//           itemBuilder: (context, index) {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '${payment[index].title}',
//                   style: CustomTextStyles.poppinsMediumBlack(fontSize: 16),
//                 ),
//                 Text(
//                   '₹${payment[index].amount}',
//                   style: CustomTextStyles.poppinsMediumCustom(
//                       fontSize: 16,
//                       color: payment[index].title == 'Coupon Discount'
//                           ? ColorStyle.themeColor
//                           : ColorStyle.black2C2C2C),
//                 ),
//               ],
//             );
//           }),
//     );
//   }
//
//   radioListTile() {
//     var data = controller.model.value.data![widget.indexNum];
//     return Container(
//       width: Get.width,
//       height: 80,
//       child: RadioListTile(
//         controlAffinity: ListTileControlAffinity.trailing,
//         value: widget.indexNum,
//         groupValue: widget.indexNum,
//         onChanged: (value) {},
//         contentPadding: EdgeInsets.zero,
//         activeColor: ColorStyle.themeColor,
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               ImageStyle.cashOnDelivery,
//               fit: BoxFit.cover,
//             ),
//             Text(
//               "Cash On Delivery",
//               style: CustomTextStyles.poppinsSemiBoldBlack(fontSize: 13),
//             ),
//             Text(''),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Controller/PlaceOrderController.dart';
import 'package:firstdose_user/Data/AppButton.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/AddressController.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({Key? key, required this.indexNum}) : super(key: key);

  final int indexNum;

  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  final MyCartController myCartController = Get.put(MyCartController());
  final AddressController addressController = Get.put(AddressController());
  final PlaceOrderController placeOrderController =
      Get.put(PlaceOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Order Review',
        isLeading: true,
        isCartIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summery',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            listPaymentContainer(),
            const SizedBox(height: 15),
            Text(
              'Payment Method',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            radioContainer(),
            const SizedBox(height: 15),
            Text(
              'Delivery Address ',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            addressContainer(),
            SizedBox(height: Get.height * 0.10),
            InkWell(
              onTap: () {
                placeOrderController.placeOrder(
                    myCartController.model.value.data!.id.toString(),
                    addressController.model.value.data![widget.indexNum].id
                        .toString());
              },
              child: AppButton(
                  buttoncolor: ColorStyle.themeColor,
                  buttonfontcolor: ColorStyle.whitecolor,
                  buttontext: "Place Order"),
            )
          ],
        ),
      ),
    );
  }

  Widget listPaymentContainer() {
    var payment = myCartController.model.value.data!.payments!;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      height: 100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: payment.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${payment[index].title}',
                style: CustomTextStyles.poppinsMediumBlack(fontSize: 16),
              ),
              Text(
                '₹${payment[index].amount}',
                style: CustomTextStyles.poppinsMediumCustom(
                  fontSize: 16,
                  color: payment[index].title == 'Coupon Discount'
                      ? ColorStyle.themeColor
                      : ColorStyle.black2C2C2C,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget radioContainer() {
    return Container(
      width: Get.width,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorStyle.whitecolor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            ImageStyle.cashOnDelivery,
            fit: BoxFit.cover,
            height: 60,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cash On Delivery",
                  style: CustomTextStyles.poppinsSemiBoldBlack(fontSize: 13),
                ),
                Text(
                  "Pay in cash when your order arrive",
                  style: CustomTextStyles.poppinsRegularBlack(fontSize: 12),
                ),
              ],
            ),
          ),
          // Custom radio indicator
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorStyle.themeColor),
            ),
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorStyle.themeColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressContainer() {
    var data = addressController.model.value.data![widget.indexNum];
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: ColorStyle.whitecolor,
        border: Border.all(color: ColorStyle.whitecolor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name!.toString(),
            style: CustomTextStyles.poppinsSemiBoldBlack(fontSize: 13),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            (data.fullAddress == null || data.fullAddress!.isEmpty)
                ? ''
                : data.fullAddress! +
                    ' , ' +
                    data.city! +
                    ' , ' +
                    data.state! +
                    ' , ' +
                    data.pinCode!,
            style: CustomTextStyles.poppinsMediumBlack(fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            data.phoneNumber!.toString(),
            style: CustomTextStyles.poppinsSemiBoldBlack(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
