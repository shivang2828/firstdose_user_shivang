import 'package:firstdose_user/Controller/LogOutController.dart';
import 'package:firstdose_user/Controller/WebView.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/EditProfile.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/WishList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Utils/Const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoggedIn = false;
  final controller = Get.put(LogOutController());

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    bool loginStatus = sharedPref.getBool(isLogin) ?? false;

    setState(() {
      isLoggedIn = loginStatus;
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Settings',
        isCartIcon: false,
        isLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                siteSettingData.value.data!.profile!.name != null?
                                Text('${siteSettingData.value.data!.profile!.name}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: ColorStyle.themeColor,
                                      fontWeight: FontWeight.bold,
                                    )):Text('User Name',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: ColorStyle.themeColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => EditProfile());
                                  },
                                  child: Text('Edit Profile',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
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
                    Get.to(() => Wishlist());
                  },
                  child: customContainer(
                      imageName: ImageStyle.wishlist, name: 'Wishlist')
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.to(() => WebView(
                        url:
                            'https://kbdevs.com/firstdose/terms-and-conditions',
                        name: 'Terms and Conditions',
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
                        name: 'Privacy Policy',
                      ));
                },
                child: customContainer(
                    imageName: ImageStyle.privacyPolicy,
                    name: 'Privacy Policy'),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.to(() => WebView(
                        url: 'https://kbdevs.com/firstdose/contact-us',
                        name: 'Contact Us',
                      ));
                },
                child: customContainer(
                  imageName: ImageStyle.contactUs,
                  name: 'Contact Us',
                ),
              ),
              const SizedBox(height: 30),

              InkWell(
                  onTap: () {
                    Get.to(() => SafeArea(
                          child: WebView(
                            url: 'https://kbdevs.com/firstdose/faq',
                            name: 'FAQ',
                          ),
                        ));
                  },
                  child:
                      customContainer(imageName: ImageStyle.faq, name: 'FAQ')),
              const SizedBox(height: 30),
              if (isLoggedIn) ...[
                InkWell(
                    onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('FirstDose',
                                style: GoogleFonts.poppins(
                                  color: ColorStyle.black2C2C2C,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            content: Text('Are you Sure, want to logout?',
                                style: GoogleFonts.poppins(
                                  color: ColorStyle.black2C2C2C,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text('Cancel',
                                    style: GoogleFonts.poppins(
                                      color: ColorStyle.themeColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // SharedPreferences sharedPref =
                                  //     await SharedPreferences.getInstance();
                                  //
                                  // await sharedPref.clear();
                                  controller.userLogout();


                                },
                                child: Text('OK',
                                    style: GoogleFonts.poppins(
                                      color: ColorStyle.themeColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            ],
                          ),
                        ),
                    child: customContainer(
                        imageName: ImageStyle.logout, name: 'LogOut')),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('FirstDose',
                          style: GoogleFonts.poppins(
                            color: ColorStyle.black2C2C2C,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      content:
                          Text('Are you Sure, want to Delete Your Account?',
                              style: GoogleFonts.poppins(
                                color: ColorStyle.black2C2C2C,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text('Cancel',
                              style: GoogleFonts.poppins(
                                color: ColorStyle.themeColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        TextButton(
                          onPressed: () async {
                            SharedPreferences sharedPref =
                                await SharedPreferences.getInstance();

                            await sharedPref.clear();

                            // Perform the navigation
                            Get.offAll(() => LoginScreen());
                          },
                          child: Text('OK',
                              style: GoogleFonts.poppins(
                                color: ColorStyle.themeColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                      ],
                    ),
                  ),
                  child: customContainer(
                      name: 'Delete Account',
                      imageName: ImageStyle.deleteAccount),
                ),
              ]
            ],
          )),
        ),
      ),
    );
  }
}

customContainer({required String name, required String imageName}) {
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
