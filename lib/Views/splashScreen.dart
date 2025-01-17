import 'dart:async';

import 'package:firstdose_user/Views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Add constructor name here

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(); // Use Splashscreen here
}

class _SplashScreenState extends State<SplashScreen> {
  // Use correct State class

  @override
  void initState() {
    sharedPref();
    // TODO: implement initState
    super.initState();
  }

  sharedPref() {
    Timer(
      Duration(seconds: 1),
      () {
        Get.offAll(LoginScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          child: Image.asset(
            'assets/images/splash.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
