import 'dart:async';

import 'package:firstdose_user/Utils/Const.dart';
import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:firstdose_user/Views/NavigationBar/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }


  Future<void> _initializeApp() async {
    // await _requestNotificationPermission();
    _checkLoginAndNavigate();
  }

  // Future<void> _requestNotificationPermission() async {
  //   final status = await Permission.notification.request();
  //   if (status.isGranted) {
  //     print("Notification permission granted.");
  //   } else if (status.isDenied) {
  //     print("Notification permission denied.");
  //   } else if (status.isPermanentlyDenied) {
  //     await openAppSettings();
  //   }
  // }

  Future<void> _checkLoginAndNavigate() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    var isUserLogin = sharePref.getBool(isLogin);

    Timer(
      const Duration(seconds: 3),
      () {
        if (isUserLogin != null && isUserLogin) {
          Get.offAll(BottomNavBar(selected: 0));
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
