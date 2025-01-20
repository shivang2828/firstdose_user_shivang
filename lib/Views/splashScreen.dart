import 'dart:async';

import 'package:firstdose_user/Views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // sharedPref();
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Get.offAll(LoginScreen());
      },
    );
    // whereToGo();
  }

  // sharedPref() {
  //
  // }



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

//   void whereToGo() {
//
//     var sharedPref =SharedPreferences.getInstance();
//
//     var isLogin = sharedPref.getBool(KEYLOGIN);
//
//
//     Timer(
//             Duration(seconds: 1),
//             () {
//               Get.offAll(LoginScreen());
//             },
//           );
//   }
// }
