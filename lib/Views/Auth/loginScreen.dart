import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
import 'package:firstdose_user/Views/NavigationBar/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/loginController.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  final mobileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var h = Get.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offAll(BottomNavBar(
                          selected: 0,
                        ));
                      },
                      child: Text(
                        'Skip',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorStyle.themeColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 60),
                // Login Image
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 300,
                      width: Get.width,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                _buildMiddleText(),
                SizedBox(height: 40),

                Form(
                  key: mobileFormKey,
                  child: TextFormField(
                    controller: controller.phoneController.value,
                    style: TextStyle(
                      fontWeight: FontWeight.w400
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10)
                    ],
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
                        borderSide: BorderSide(
                            color: ColorStyle.blackcolor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: ColorStyle.blackcolor, width: 0.5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This can\'t be empty';
                      } else if (value.length != 10) {
                        return 'Enter a 10 Digit Number';
                      } else {
                        return null;
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
                        controller.userLogin();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please enter a valid phone number')),
                        );
                      }
                    },
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleText() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your mobile number',
              style: CustomTextStyles.poppinsBoldBlack(fontSize: 25),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              'We will send to you a 6 digit confirmation code.',
              style: CustomTextStyles.poppinsRegularCustom(
                  fontSize: 14, color: ColorStyle.greycolor),
            ),
          ],
        ),
      ],
    );
  }
}
