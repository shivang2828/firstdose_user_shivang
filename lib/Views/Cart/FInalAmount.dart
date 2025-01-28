import 'package:firstdose_user/Controller/AddressController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/ShippingInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';

class FinalAmount extends StatefulWidget {
  const FinalAmount({super.key});

  @override
  State<FinalAmount> createState() => _FinalAmountState();
}

class _FinalAmountState extends State<FinalAmount> {
  final controller = Get.put(AddressController());

  @override
  void initState() {
    // TODO: implement initState

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
                      onTap: () {
                        
                        Get.to(() => ShippingInformation());
                      },
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

                Obx(
                      () {
                    if (controller.isLoading.value) {
                      return Center(
                        child: SpinKitRotatingPlain(
                          color: ColorStyle.themeColor,
                          size: 50.0,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: controller.model.value.data!.length,
                        itemBuilder: (context, index) {
                          var data = controller.model.value.data![index];
                          return Obx(
                                () => Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: (controller.selectedAddress.value == index)
                                      ? ColorStyle.themeColor
                                      : ColorStyle.black2C2C2C,
                                  width: 1,
                                ),
                              ),
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                activeColor: ColorStyle.themeColor,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name!,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${data.fullAddress!} , ${data.city!} , ${data.state!} , ${data.pinCode!}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                      ),


                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${data.phoneNumber.toString()}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                      )


                                    ),
                                  ],
                                ),
                                value: index,
                                groupValue: controller.model.value,
                                onChanged: (value) {
                                  setState(() {
                                    controller.selectedAddress.value = index;
                                  });
                                  // controller.selectedAddress.value = index;
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),



                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: Get.width,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Button border radius
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
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

Widget listContainer({required String name}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: ColorStyle.whitecolor,
      border: Border.all(
        width: 0.5,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black, // Adjust text color as needed
        ),
      ),
    ),
  );
}
