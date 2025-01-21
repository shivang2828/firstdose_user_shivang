import 'package:firstdose_user/Views/Auth/loginScreen.dart';
import 'package:firstdose_user/Views/Auth/otpScreen.dart';
import 'package:firstdose_user/Views/Dashboard/Profile/Profile.dart';
import 'package:firstdose_user/Views/Dashboard/Upload/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Styles/ColorStyle.dart';

// import '../Styles/ColorStyle.dart';
import 'package:flutter/src/rendering/box.dart';

import '../Search/Search.dart'; // Assuming you have a ColorStyle class for colors

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    // ProfileScreen(),
    // SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:  Container(
      //   height: 60,
      //   width: Get.width,
      //   color: Colors.red,
      //
      //   child: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home,color: Colors.red,),
      //         label: 'Home', // Optional label for the Home button
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search,color: Colors.red,),
      //         label: 'Search', // Optional label for the Search button
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle,color: Colors.red,),
      //         label: 'Profile', // Optional label for the Profile button
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle,color: Colors.red,),
      //         label: 'Profile', // Optional label for the Profile button
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle,color: Colors.redAccent,),
      //         label: 'Profile',
      //
      //       ),
      //     ],
      //     currentIndex: _currentIndex, // To highlight the first icon initially
      //     onTap: (index) {
      //       _currentIndex = index;
      //       setState(() {
      //
      //       });
      //       // You can handle the navigation here based on the selected index
      //       print('Selected index: $index');
      //       if(index == 4){
      //         Get.to(() => const Profile());
      //       }
      //
      //       // switch(index){
      //       //   case 1 : Get.to(() => const SearchMedicine());
      //       //   break;
      //       //
      //       //   case 2 : Get.to(() => const Profile());
      //       //   break;
      //       //
      //       //   case 3 : Get.to(() => const UploadImage());
      //       //   break;
      //       //
      //       //   case 3 : Get.to(() => const U());
      //       //   break;
      //       //
      //       //
      //       //
      //       //
      //       // }
      //     },
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Uncommented Back Button (if needed)
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: InkWell(
                //     onTap: () {
                //       Get.back();
                //     },
                //     child: Image.asset(
                //       'assets/images/backwardarrow.png',
                //       color: ColorStyle.themeColor, // Ensure themeColor is defined
                //       height: 20,
                //       width: 20,
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/appLogoIconPNG.png',
                      height: 30, // Adjust the height as necessary
                      width: 200, // Adjust the width as necessary
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                CustomSearchBar(
                  leading: const Icon(Icons.search, color: Colors.grey),
                  hintText: "Search medicines..",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                ImageSlideshow(
                  indicatorColor: Colors.blue,
                  width: Get.width,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ShopCategory(),
                // BottomNavigation(),
                const SizedBox(height: 20),

                // GridView.count(
                //     shrinkWrap: true,
                //   crossAxisSpacing: 5,
                //   mainAxisSpacing: 1,
                //   crossAxisCount: 3,
                //   children: <Widget>[
                //
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       child: Column(
                //         // mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Expanded(child: Image.asset('assets/images/skincare.png')),
                //           SizedBox(height: 1),
                //           Expanded(
                //             child: Text(
                //               'Your Text Here',
                //               style: TextStyle(
                //                 fontSize: 5,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       // color: Colors.teal[200],
                //       child: Image.asset('assets/images/vitamins.png'),
                //       height: 1,
                //       width: 1,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       // color: Colors.teal[300],
                //       child: Image.asset('assets/images/vitamins.png'),
                //       // height: 1,
                //       // width: 1,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       // color: Colors.teal[400],
                //       child: Image.asset('assets/images/vitamins.png'),
                //       // height: 1,
                //       // width: 1,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       // color: Colors.teal[500],
                //       child: Image.asset('assets/images/vitamins.png'),
                //       // height: 1,
                //       // width: 1,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       // color: Colors.teal[600],
                //       child: Image.asset('assets/images/vitamins.png'),
                //       // height: 1,
                //       // width: 1,
                //     ),
                //   ],
                // )
                // GridView.count(
                //   shrinkWrap: true,
                //   crossAxisSpacing: 16,  // Spacing between columns
                //   mainAxisSpacing: 20 ,   // Spacing between rows
                //   crossAxisCount: 3,    // 3 items per row
                //    Column(
                //     children: [
                //       ClipRRect(
                //           borderRadius: BorderRadius.circular(10),
                //           child: Image.asset(
                //               'assets/images/skincare.jpg',
                //               height: 60,
                //              )),
                //
                //
                //       Flexible(
                //         child: Text(
                //           'SkinCare',
                //           overflow: TextOverflow.ellipsis,
                //           maxLines: 2,
                //           // 'safdsdsdggfdfdgfdgdgffdfdgdgdgfdgd',
                //           ,
                //           textAlign: TextAlign.center,
                //           style: CustomTextStyles.poppinsBoldBlack(fontSize: 13),
                //         ),
                //       )
                //
                //     ],
                //   ),
                // )

                // GridView.count(
                // shrinkWrap: true,
                // crossAxisSpacing: 12,  // Spacing between columns
                // mainAxisSpacing: 12,   // Spacing between rows
                // crossAxisCount: 3,     // 3 items per row
                // children: List.generate(9, (index) {
                //   return Column(
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.asset(
                //           'assets/images/skincare.png',
                //           height: 60,
                //
                //         ),
                //       ),
                //       Flexible(
                //         child: Text(
                //           'SkinCareutgngnggjgjgghghghghghggunuhgrhg',
                //           overflow: TextOverflow.ellipsis,
                //           maxLines: 1,
                //           textAlign: TextAlign.center,
                //           style: GoogleFonts.poppins(
                //             fontSize: 13,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //     ],
                //   );
                // }),
                //

                // ),
                gridBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  final Widget leading;
  final String hintText;
  final TextStyle hintStyle;

  CustomSearchBar({
    required this.leading,
    required this.hintText,
    required this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: leading,
        hintText: hintText,
        hintStyle: hintStyle,
        filled: true,
        fillColor: Colors.white,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}

class gridBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 12,

      // mainAxisSpacing: 1,

      crossAxisCount: 3,
      // 3 items per row
      children: List.generate(9, (index) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/skincare.png',
                height: 50,
              ),
            ),
            Flexible(
              child: Text(
                'SkinCare',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ShopCategory extends StatelessWidget {
  const ShopCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.0),
      child: Text(
        "Shop By Category",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
