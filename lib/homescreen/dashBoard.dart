import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Styles/ColorStyle.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              'assets/images/backwardarrow.png',
              color: ColorStyle.themeColor, // Ensure themeColor is defined
              height: 20,
              width: 20,
            ),
          ),
        ),
            ),
      ),
    );
  }
}
