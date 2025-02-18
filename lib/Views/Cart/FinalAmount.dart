import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstdose_user/Controller/AddressController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/OrderReview.dart';
import 'package:firstdose_user/Views/Cart/ShippingInformation.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';

class FinalAmount extends StatefulWidget {
  const FinalAmount({super.key});

  // final String subtotal;
  // final String grandtotal;

  @override
  State<FinalAmount> createState() => _FinalAmountState();
}

class _FinalAmountState extends State<FinalAmount> {
  final AddressController controller = Get.put(AddressController());
  final MyCartController myCartController = Get.put(MyCartController());

  @override
  void initState() {
    super.initState();

    controller.addressController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Final Amount',
        isCartIcon: false,
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorStyle.whitecolor,
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // paymentSummery(
                    //     name: 'Subtotal', price: '₹${widget.subtotal}'),
                    // paymentSummery(name: 'Delivery partner fee', price: '₹40'),
                    // paymentSummery(name: 'Coupon discount', price: '₹0'),
                    // paymentSummery(name: 'GST', price: '₹15'),
                    // paymentSummery(
                    //     name: 'Grand Total', price: '₹${widget.grandtotal}'),
                    listPaymentContainer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select a Delivery Address',
                    style: CustomTextStyles.poppinsMediumBlack(fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ShippingInformation());
                    },
                    child: Text(
                      'Add new address',
                      style: CustomTextStyles.poppinsRegularTheme(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorStyle.themeColor,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.model.value.data!.length,
                      itemBuilder: (context, index) {
                        var data = controller.model.value.data![index];
                        return Obx(
                          () => Container(
                            // padding: EdgeInsets.symmetric(vertical: 5),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: (controller.selectedAddress.value ==
                                            index)
                                        ? ColorStyle.themeColor
                                        : ColorStyle.greyD9D9D9,
                                    width: 1)),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              activeColor: ColorStyle.themeColor,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name!.toString(),
                                    style:
                                        CustomTextStyles.poppinsSemiBoldBlack(
                                            fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    (data.fullAddress == null ||
                                            data.fullAddress!.isEmpty)
                                        ? ''
                                        : data.fullAddress! +
                                            ' , ' +
                                            data.city! +
                                            ' , ' +
                                            data.state! +
                                            ' , ' +
                                            data.pinCode!,
                                    style: CustomTextStyles.poppinsRegularBlack(
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data.phoneNumber!.toString(),
                                    style:
                                        CustomTextStyles.poppinsSemiBoldBlack(
                                            fontSize: 13),
                                  ),
                                ],
                              ),
                              value: index,
                              groupValue: controller.selectedAddress.value,
                              onChanged: (value) {
                                controller.selectedAddress.value = index;
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() =>  OrderReview(indexNum: controller.selectedAddress.value));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorStyle.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listPaymentContainer() {
    var payment = myCartController.model.value.data!.payments!;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      // width: Get.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      height: 100,

      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
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
                          : ColorStyle.black2C2C2C),
                ),
              ],
            );
          }),
    );
  }
}
