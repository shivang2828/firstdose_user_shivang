import 'package:firstdose_user/Views/Cart/FinalAmount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstdose_user/Styles/ColorStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/OrderReview.dart';
import '../../Controller/AddressController.dart';

class ShippingInformation extends StatefulWidget {
  const ShippingInformation({Key? key}) : super(key: key);

  @override
  State<ShippingInformation> createState() => _ShippingInformationState();
}

class _ShippingInformationState extends State<ShippingInformation> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fullAddressController = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinCodeController = TextEditingController();

  String selectedAddressType = 'Home';

  final AddressController addressController = Get.put(AddressController());


  Widget customTextField(
      {required String hintText, required TextEditingController controller}) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: ColorStyle.greycolor,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorStyle.themeColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorStyle.themeColor, width: 0.5),
          ),
        ),
      ),
    );
  }

  Widget addressTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addressTypeButton('Home'),
        addressTypeButton('Work'),
        addressTypeButton('Other'),
      ],
    );
  }

  Widget addressTypeButton(String type) {
    bool isSelected = selectedAddressType == type;
    return InkWell(
      onTap: () {
        setState(() {
          selectedAddressType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyle.themeColor : ColorStyle.whitecolor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? ColorStyle.themeColor
                : ColorStyle.boxShadowColor25,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              type == 'Home'
                  ? Icons.home
                  : type == 'Work'
                      ? Icons.work
                      : Icons.location_on,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 5),
            Text(
              type,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Shipping Information',
        isLeading: true,
        isCartIcon: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Address',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorStyle.themeColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.my_location,
                            color: Colors.white, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          "Use My Current Location",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                customTextField(
                    hintText: 'Full Name', controller: fullNameController),
                const SizedBox(height: 15),
                customTextField(
                    hintText: 'Enter Your Number',
                    controller: phoneNumberController,

                ),
                const SizedBox(height: 15),
                customTextField(
                    hintText: 'Enter Your Address',
                    controller: fullAddressController),
                const SizedBox(height: 15),
                customTextField(
                    hintText: 'Enter Your Landmark',
                    controller: landmarkController),
                const SizedBox(height: 15),
                customTextField(
                    hintText: 'Enter Your City', controller: cityController),
                const SizedBox(height: 15),
                customTextField(hintText: 'State', controller: stateController),
                const SizedBox(height: 15),
                customTextField(hintText: 'PinCode', controller: pinCodeController),
                const SizedBox(height: 15),
                addressTypeSelector(),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      await addressController.addNewAddress(
                        fullNameController.text,
                        phoneNumberController.text,
                        fullAddressController.text,
                        landmarkController.text,
                        cityController.text,
                        stateController.text,
                        pinCodeController.text,
                      );

                      await addressController.addressController();

                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Confirm Your Address",
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
      ),
    );
  }
}
