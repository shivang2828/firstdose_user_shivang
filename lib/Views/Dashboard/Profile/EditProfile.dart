// import 'package:firstdose_user/Styles/ImageStyle.dart';
// import 'package:firstdose_user/Utils/CustomAppBar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../Styles/ColorStyle.dart';
//
// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});
//
//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     var h = Get.height;
//     var w = Get.width;
//     return Scaffold(
//       appBar: CustomAppBar(
//         isLeading: true,
//         isCartIcon: false,
//         appbarTitle: 'Edit Profile',
//       ),
//
//
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 customContainer(
//                     name: 'First Name', imageName: ImageStyle.namePrefix),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 customContainer(
//                     name: 'Last Name', imageName: ImageStyle.namePrefix),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // customContainer(
//                 //     name: 'Phone Number', imageName: ImageStyle.mobilePrefix),
//             Container(
//               margin: const EdgeInsets.only(top: 2),
//               width: double.infinity,
//               height: 56,
//               child: TextFormField(
//                 readOnly: true,
//                 textAlign: TextAlign.left,
//                 decoration: InputDecoration(
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.all(10.0), // Adjust padding if necessary
//                     child: Image.asset(
//                       ImageStyle.mobilePrefix,
//                       height: 24,
//                       width: 24,
//                       color: ColorStyle.themeColor,
//                     ),
//                   ),
//                   hintText: 'Phone Number',
//                   hintStyle: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w400,
//                     color: ColorStyle.themeColor,
//                   ),
//                   fillColor: ColorStyle.lightthemencolor,
//                   filled: true,
//                   contentPadding: EdgeInsets.all(16),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                     BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                     BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
//                   ),
//                 ),
//               ),
//             ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 customContainer(
//                     name: 'Email', imageName: ImageStyle.emailPrefix),
//                 SizedBox(
//                   height: h * 0.3,
//                 ),
//                 Container(
//                   width: Get.width,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorStyle.themeColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.circular(12), // Button border radius
//                       ),
//                     ),
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // Text color
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget customContainer({
//   required String name,
//   required String imageName,
// }) {
//   return Container(
//     margin: const EdgeInsets.only(top: 2),
//     width: double.infinity,
//     height: 56,
//     child: TextFormField(
//       textAlign: TextAlign.left,
//       decoration: InputDecoration(
//         prefixIcon: Padding(
//           padding: const EdgeInsets.all(10.0), // Adjust padding if necessary
//           child: Image.asset(
//             imageName,
//             height: 24,
//             width: 24,
//             color: ColorStyle.themeColor,
//           ),
//         ),
//         hintText: name,
//         hintStyle: GoogleFonts.poppins(
//           fontWeight: FontWeight.w400,
//           color: ColorStyle.themeColor,
//         ),
//         fillColor: ColorStyle.lightthemencolor,
//         filled: true,
//         contentPadding: EdgeInsets.all(16),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide:
//               BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide:
//               BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
//         ),
//       ),
//     ),
//   );
// }
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/EditProfileController.dart';
import '../../../Data/AppButton.dart';
import '../../../Models/SiteSeetingModel.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Styles/ImageStyle.dart';
import '../../../Utils/Const.dart';
import '../../../Utils/CustomAppBar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameFormKey = GlobalKey<FormState>();
  final numberFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();

  // var siteSettingData = SiteSettingModel().obs;

  EditProfileController controller = Get.put(EditProfileController());

  @override
  void initState() {
    // TODO: implement initState

    controller.nameTextFieldController.value.text =
        siteSettingData.value.data!.profile!.name ?? '';
    controller.emailTextFieldController.value.text =
        siteSettingData.value.data!.profile!.email ?? '';
    controller.mobileTextFieldController.value.text =
        siteSettingData.value.data!.profile!.phoneNumber!.toString() ?? '';

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<EditProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = Get.height;
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldbgcolor,
      appBar: CustomAppBar(
        isLeading: true,
        isCartIcon: false,
        appbarTitle: 'Edit Profile',
      ),
      body: Obx(() {
        if (controller.processing.value) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorStyle.themeColor,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: h * 0.03),
                  _customTextfields(
                    hintText: 'Name',
                    prefixImage: ImageStyle.namePrefix,
                    key: nameFormKey,
                    controller: controller.nameTextFieldController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This filed cant be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: h * 0.04),
                  _customTextfields(
                    controller: controller.emailTextFieldController.value,
                    key: emailFormKey,
                    hintText: 'Email',
                    prefixImage: ImageStyle.emailPrefix,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Filed cant be empty';
                      } else {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);

                        if (emailValid) {
                          return null;
                        } else {
                          return 'Enter a valid email';
                        }
                      }
                    },
                  ),
                  SizedBox(height: h * 0.04),
                  _customTextfields(
                    readOnly: true,
                    hintText: 'Mobile Number',
                    prefixImage: ImageStyle.mobilePrefix,
                    key: numberFormKey,
                    controller: controller.mobileTextFieldController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This filed cant be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: h * 0.10),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        if (nameFormKey.currentState!.validate() &&
                            emailFormKey.currentState!.validate()) {
                          controller.updateProfile();
                        }
                      },
                      child: AppButton(
                        buttoncolor: controller.processing.value
                            ? ColorStyle.lightthemencolor
                            : ColorStyle.themeColor,
                        buttonfontcolor: controller.processing.value
                            ? ColorStyle.blackcolor
                            : ColorStyle.whitecolor,
                        buttontext: controller.processing.value
                            ? 'Please Wait...'
                            : 'Submit ',
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  _customTextfields(
      {required String hintText,
      required String prefixImage,
      TextInputType keyBoardType = TextInputType.text,
      required Key key,
      bool readOnly = false,
      required TextEditingController controller,
      required String? Function(String?)? validator}) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorStyle.lightthemencolor),
        child: Form(
          key: key,
          child: TextFormField(
            controller: controller,
            validator: validator,
            cursorColor: ColorStyle.greycolor,
            keyboardType: keyBoardType,
            readOnly: readOnly,
            style: CustomTextStyles.poppinsMediumBlack(fontSize: 14),
            decoration: InputDecoration(
                isCollapsed: false,
                border: InputBorder.none,
                isDense: false,
                fillColor: ColorStyle.lightthemencolor,
                filled: false,
                hintStyle: CustomTextStyles.poppinsRegularCustom(
                    fontSize: 14,
                    color: ColorStyle.themeColor.withOpacity(0.67)),
                hintText: hintText,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Image.asset(
                    prefixImage,
                    height: 16,
                    width: 16,
                  ),
                )),
          ),
        ));
  }
}
