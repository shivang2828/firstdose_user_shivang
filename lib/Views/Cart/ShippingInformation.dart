import 'package:firstdose_user/Styles/ColorStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Cart/SelectPaymentMethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:geolocator/geolocator.dart';

import '../../Utils/CurrentLocation.dart';

class ShippingInformation extends StatefulWidget {
  const ShippingInformation({super.key});

  @override
  State<ShippingInformation> createState() => _ShippingInformationState();
}

class _ShippingInformationState extends State<ShippingInformation> {
  final CurrentLocation controller = Get.put(CurrentLocation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Shipping Information',
        isLeading: true,
        isCartIcon: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Flexible(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: Get.width,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorStyle.themeColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.my_location,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Use My Current Location",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Display the current location text after fetching
                  // Obx(() => currentLocationText.isEmpty
                  //     ? SizedBox.shrink() // If no location yet, don't show anything
                  //     : Text(
                  //   'Current Location: ${currentLocationText.value}',
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black2C2C2C,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      customContainer(name: 'Full Name'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Phone Number',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black2C2C2C,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      customContainer(name: 'Enter Your Number'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Full Address',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black2C2C2C,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      customContainer(name: 'Enter Your Address'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Landmark',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black2C2C2C,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      customContainer(name: 'Enter Your Landmark'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'City',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black2C2C2C,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      customContainer(name: 'Enter Your City'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'State',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black2C2C2C,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      customContainer(name: 'State'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  addressType(),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    width: Get.width,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => SelectPaymentMethod());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyle.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Button border radius
                        ),
                      ),
                      child: Text(
                        "Confirm Your Address",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),

                  // customContainer(name: 'Full Name'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget getInformation({required String name}) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//     width: Get.width,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           width: 0.5,
//           color: ColorStyle.boxShadowColor25,
//         )),
//     child: Text(
//       name,
//     ),
//   );
// }

Widget customContainer({ required String name,}) {
  return Container(
    margin: const EdgeInsets.only(top: 2),
    width: double.infinity,
    // height: 56,
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(12),
    //   border: Border.all(
    //     color: ColorStyle.themeColor,
    //     width: 0.5,
    //   )
    // ),
    child: TextFormField(
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.all(10.0), // Adjust padding if necessary
        //   child: Image.asset(
        //     imageName,
        //     height: 24,
        //     width: 24,
        //     color: ColorStyle.themeColor,
        //   ),
        // ),
        hintText: name,
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: ColorStyle.greycolor,
        ),
        // fillColor: ColorStyle.lightthemencolor,
        // filled: true,
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.themeColor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.themeColor, width: 0.5),
        ),
      ),
    ),
  );
}

Widget addressType() {
  String slectedaddress = '';

  return StatefulBuilder(
    builder: (context, setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                slectedaddress = 'Home';
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: slectedaddress == 'Home'
                    ? ColorStyle.themeColor
                    : ColorStyle.whitecolor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: slectedaddress == 'Home'
                      ? ColorStyle.themeColor
                      : ColorStyle.boxShadowColor25,
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home, // Icon for Home
                    color:
                        slectedaddress == 'Home' ? Colors.white : Colors.black,
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: slectedaddress == 'Home'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                slectedaddress = 'Work';
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: slectedaddress == 'Work'
                    ? ColorStyle.themeColor
                    : ColorStyle.whitecolor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: slectedaddress == 'Work'
                      ? ColorStyle.themeColor
                      : ColorStyle.boxShadowColor25,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.work, // Icon for Work
                    color:
                        slectedaddress == 'Work' ? Colors.white : Colors.black,
                  ),
                  // Space between icon and text
                  Text(
                    'Work',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: slectedaddress == 'Work'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                slectedaddress = 'Other';
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: slectedaddress == 'Other'
                    ? ColorStyle.themeColor
                    : ColorStyle.whitecolor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: slectedaddress == 'Other'
                      ? ColorStyle.themeColor
                      : ColorStyle.boxShadowColor25,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on, // Icon for Other
                    color:
                        slectedaddress == 'Other' ? Colors.white : Colors.black,
                  ),
                  Text(
                    'Other',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: slectedaddress == 'Other'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
