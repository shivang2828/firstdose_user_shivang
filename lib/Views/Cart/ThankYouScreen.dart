import 'dart:async';

import 'package:firstdose_user/Styles/CustomTextStyles.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Views/Dashboard/Home/HomeScreen.dart';
import 'package:firstdose_user/Views/NavigationBar/NavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  Timer? _timer;
  int remainingTime = 10;

  void countDown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime == 0) {
        timer.cancel();
        Get.to(() => BottomNavBar(selected: 0,));
      } else {
        setState(() {
          remainingTime--;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(ImageStyle.thankuAnimation),
          const SizedBox(
            height: 10,
          ),
          Text(
            "You Will be Redirected to Home Screen In ${remainingTime} seconds",
            style: CustomTextStyles.poppinsMediumBlack(fontSize: 12),
          )
        ],
      ),
    );
  }
}
