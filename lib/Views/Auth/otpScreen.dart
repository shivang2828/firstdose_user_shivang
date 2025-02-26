import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../Controller/otpController.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final controller = Get.put(OtpController());

  final mobileFormKey = GlobalKey<FormState>();

  // controller.phoneController.value.text = widget.phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    'assets/images/backwardarrow.png',
                    color: ColorStyle.themeColor,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              // OTP image
              Center(
                child: Image.asset(
                  'assets/images/otp.png',
                  height: 300,
                  width: Get.width,
                ),
              ),
              const SizedBox(height: 60),
              // Title
              Text(
                "Verify Phone Number",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 13),

              Text(
                "Code is sent to +91 xxxxxx${widget.phoneNumber.substring(6, 10)}",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              // OTP Input Field
              Form(
                key: mobileFormKey,
                child: Column(
                  children: [
                    Pinput(
                      defaultPinTheme: PinTheme(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 50,
                        height: 60,
                        textStyle:
                            CustomTextStyles.poppinsSemiBoldBlack(fontSize: 25),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(237, 237, 237, 1),
                        ),
                      ),
                      controller: controller.otpController.value,
                      length: 6,
                      closeKeyboardWhenCompleted: true,
                      showCursor: true,
                      toolbarEnabled: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // Continue button
              Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (mobileFormKey.currentState!.validate()) {
                      controller.otpLogin(widget.phoneNumber);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorStyle.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
