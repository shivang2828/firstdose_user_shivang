import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firstdose_user/Views/otpScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/loginController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/CustomTextStyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Initialize the login controller using GetX
  final controller = Get.put(LoginController());

  // Global key for the form
  final mobileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15), // Unified padding for all sides
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              // Login Image
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30), // Add vertical padding too
                  child: Image.asset(
                    'assets/images/login.png',  // Ensure this path is correct
                    height: 300,
                    width: Get.width,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Middle Text Widget
              _buildMiddleText(),
              SizedBox(height: 40),

              // Form for Mobile Number Input
              Form(
                key: mobileFormKey,
                child: TextFormField(
                  controller: controller.phoneController.value,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: ColorStyle.themeColor,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This can\'t be empty';
                    } else if (value.length != 10) {
                      return 'Enter a 10 Digit Number';
                    } else {
                      return null;  // If valid, return null
                    }
                  },
                ),
              ),
              const SizedBox(height: 60),
              // Continue Button
              Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (mobileFormKey.currentState!.validate()) {
                      // If form is valid, proceed to OTP screen
                      controller.userLogin();
                      Get.to(() => Otpscreen(phoneNumber: controller.phoneController.value.text));
                    } else {
                      // Optionally show an error message if invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a valid phone number')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorStyle.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Button border radius
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,  // Text color
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Middle Text widget function
  Widget _buildMiddleText() {
    return Text(
      "Login to your account",
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: ColorStyle.blackcolor,
      ),
    );
  }
}