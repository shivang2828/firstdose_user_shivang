import 'package:firstdose_user/Controller/WebView.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Utils/Const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    "Setttings",
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
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/editProfile.png',
                              fit: BoxFit.cover,
                              height: 45,

                              // alignment: Alignment.topLeft,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('User Name',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: ColorStyle.themeColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('Edit Profile',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.to(() => WebView(
                        url:
                            'https://kbdevs.com/firstdose/terms-and-conditions',
                      ));
                },
                child: customContainer(
                    imageName: ImageStyle.termsAndConditions,
                    name: 'Terms and Conditions'),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.to(() => WebView(
                        url: 'https://kbdevs.com/firstdose/privacy-policy',
                      ));
                },
                child: customContainer(
                    imageName: ImageStyle.privacyPolicy,
                    name: 'Privacy Policy'),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.to(() =>
                      WebView(url: 'https://kbdevs.com/firstdose/contact-us'));
                },
                child: customContainer(
                  imageName: ImageStyle.contactUs,
                  name: 'Contact Us',
                ),
              ),
              const SizedBox(height: 30),
              customContainer(imageName: ImageStyle.wishlist, name: 'Wishlist'),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    Get.to(() => WebView(
                          url: 'https://kbdevs.com/firstdose/faq',
                        ));
                  },
                  child:
                      customContainer(imageName: ImageStyle.faq, name: 'FAQ')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text('Are you Sure, want to logout'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                SharedPreferences sharedPref =
                                    await SharedPreferences.getInstance();

                                await sharedPref.clear();

                                // Perform the navigation
                                Get.offAll(() => LoginScreen());
                              },
                              child: const Text('OK'),
                            )
                          ],
                        ),
                      ),
                  child: customContainer(
                      imageName: ImageStyle.logout, name: 'LogOut')),
              const SizedBox(height: 30),
            ],
          )),
        ),
      ),
    );
  }
}

Widget customContainer({required String name, required String imageName}) {
  return Container(
    margin: EdgeInsets.only(top: 2),
    width: double.infinity,
    height: 44,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              imageName,
              height: 40,
              width: 40,
              color: ColorStyle.themeColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: CustomTextStyles.poppinsRegularCustom(
                  fontSize: 18, color: ColorStyle.themeColor),
            ),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: ColorStyle.themeColor,
        ),
      ],
    ),
  );
}
