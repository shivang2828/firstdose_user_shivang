import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstdose_user/Controller/AddressController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/SelectPaymentMethod.dart';
import 'package:firstdose_user/Views/Cart/ShippingInformation.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';

class FinalAmount extends StatefulWidget {
  const FinalAmount(
      {Key? key, required this.subtotal, required this.grandtotal})
      : super(key: key);

  final String subtotal;
  final String grandtotal;

  @override
  State<FinalAmount> createState() => _FinalAmountState();
}

class _FinalAmountState extends State<FinalAmount> {
  final AddressController controller = Get.put(AddressController());

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
                    paymentSummery(
                        name: 'Subtotal', price: '₹${widget.subtotal}'),
                    paymentSummery(name: 'Delivery partner fee', price: '₹40'),
                    paymentSummery(name: 'Coupon discount', price: '₹0'),
                    paymentSummery(name: 'GST', price: '₹15'),
                    paymentSummery(
                        name: 'Grand Total', price: '₹${widget.grandtotal}'),
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

              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: SpinKitRotatingPlain(
                      color: ColorStyle.themeColor,
                      size: 50.0,
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.model.value.data!.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = controller.model.value.data![index];
                        return InkWell(
                          onTap: () {
                            controller.selectedAddress.value = index;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color:
                                    (controller.selectedAddress.value == index)
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
                                  Text(data.name ?? ''),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${data.fullAddress ?? ''}, ${data.city ?? ''}, ${data.state ?? ''}, ${data.pinCode ?? ''}',
                                    style: GoogleFonts.poppins(fontSize: 15),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    data.phoneNumber.toString(),
                                    style: GoogleFonts.poppins(fontSize: 15),
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
                    ),
                  );
                }
              }),
              const SizedBox(height: 20),
              // Next button to proceed to the payment method.
              Container(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SelectPaymentMethod());
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
}

Widget paymentSummery({required String name, required String price}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Text(
          price,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
