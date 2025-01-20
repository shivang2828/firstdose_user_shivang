import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Styles/ColorStyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Settting",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Container(
                // alignment: Alignment.centerLeft,
                height: 85,
                width: Get.width,
                color: ColorStyle.lightthemencolor,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/editProfile.png',
                          fit: BoxFit.cover,
                          height: 45,
                          // alignment: Alignment.topLeft,
                        ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text('User Name'),
                              Text('Edit Profile'),
                            ],
                          ),

  ],
                      )
                      
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
