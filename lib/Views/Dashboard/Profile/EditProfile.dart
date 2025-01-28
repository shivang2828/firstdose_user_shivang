import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Styles/ColorStyle.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var h = Get.height;
    var w = Get.width;
    return Scaffold(

       appBar: CustomAppBar(
         isLeading: true,
         isCartIcon: false,
         appbarTitle: 'Edit Profile',
       ),



      // appBar: AppBar(
      //   // centerTitle: true,
      //   // surfaceTintColor: Colors.transparent,
      //   // backgroundColor: ColorStyle.whitecolor,
      //   // elevation: 0,
      //   // title: Text(
      //   //   'Profile',
      //   //   style: GoogleFonts.poppins(
      //   //       fontSize: 21,
      //   //       fontWeight: FontWeight.bold,
      //   //       color: ColorStyle.blackcolor),
      //   // ),
      //   // leading: Padding(
      //   //   padding: EdgeInsets.all(8),
      //   //   child: IconButton(
      //   //     onPressed: () {
      //   //       Get.back();
      //   //     },
      //   //     icon: Image.asset(
      //   //       ImageStyle.backwardArrow,
      //   //       color: ColorStyle.greycolor,
      //   //
      //   //       // height: 20,
      //   //     ),
      //   //   ),
      //   // ),
      //   // leadingWidth: 15,
      // ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //
                //      Image.asset(
                //       ImageStyle.backwardArrow,
                //       height: 20,
                //       width: 20,
                //       color: ColorStyle.greycolor,
                //                          ),
                //
                //     Text(
                //       "Edit Profile",
                //       style: GoogleFonts.poppins(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 40,
                ),
                customContainer(
                    name: 'First Name', imageName: ImageStyle.namePrefix),
                const SizedBox(
                  height: 10,
                ),
                customContainer(
                    name: 'Last Name', imageName: ImageStyle.namePrefix),
                const SizedBox(
                  height: 10,
                ),
                customContainer(
                    name: 'Phone Number', imageName: ImageStyle.mobilePrefix),
                const SizedBox(
                  height: 10,
                ),
                customContainer(
                    name: 'Email', imageName: ImageStyle.emailPrefix),

                SizedBox(
                  height: h * 0.3,
                ),

                Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Button border radius
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget customContainer({required String name, required String imageName}) {
//   return Container(
//     margin: EdgeInsets.only(top: 2),
//     width: double.infinity,
//     height: 34,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Image.asset(
//               imageName,
//               height: 40,
//               width: 40,
//               color: ColorStyle.themeColor,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               name,
//               style: CustomTextStyles.poppinsRegularCustom(
//                   fontSize: 18, color: ColorStyle.themeColor),
//             ),
//           ],
//         ),
//         // Icon(
//         //   Icons.arrow_forward_ios,
//         //   color: ColorStyle.themeColor,
//         // ),
//       ],
//     ),
//   );
// }

Widget customContainer({
  required String name,
  required String imageName,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 2),
    width: double.infinity,
    height: 56,
    child: TextFormField(
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0), // Adjust padding if necessary
          child: Image.asset(
            imageName,
            height: 24,
            width: 24,
            color: ColorStyle.themeColor,
          ),
        ),
        hintText: name,
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: ColorStyle.themeColor,
        ),
        fillColor: ColorStyle.lightthemencolor,
        filled: true,
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: ColorStyle.lightthemencolor, width: 0.5),
        ),
      ),
    ),
  );
}
