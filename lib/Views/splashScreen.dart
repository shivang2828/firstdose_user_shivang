import 'dart:async';

import 'package:firstdose_user/Utils/Const.dart';
import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NavigationBar/NavigationBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Add constructor name here

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(); // Use Splashscreen here
}

class _SplashScreenState extends State<SplashScreen> {
  // Use correct State class

  // static const String KEYLOGIN ='login';

  @override
  void initState() {
    sharedPref();
    // TODO: implement initState
    super.initState();

    // whereToGo();
  }

  sharedPref() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    var isUserLogin = sharePref.getBool(isLogin);

    Timer(
      Duration(seconds: 3),
      () {
        if (isUserLogin != null) {
          if (isUserLogin) {
            // Get.offAll(HomeScreen());
            Get.offAll(BottomNavBar());
          } else {
            Get.offAll(LoginScreen());
          }
        } else {
          Get.offAll(LoginScreen());
        }
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


