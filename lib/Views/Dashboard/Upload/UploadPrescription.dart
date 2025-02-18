import 'dart:io';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Styles/ColorStyle.dart';

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({super.key});

  @override
  State<UploadPrescription> createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Upload Prescription',
        isLeading: false,
        isCartIcon: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [



              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Center(
                            child: Image.asset(
                              'assets/images/uploadPrescriptionIcon.png',
                              height: Get.height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: selectImage,
                              child: Image.asset(
                                ImageStyle.gallery,
                                height: 56,
                                width: 56,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: selectFileFromCamera,
                              child: Image.asset(
                                ImageStyle.camera,
                                height: 56,
                                width: 56,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildGrid(imageFiles: imageFiles),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                              hintText: 'Your Message',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorStyle.themeColor,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: ColorStyle.blackcolor, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: ColorStyle.blackcolor, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: Get.width,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorStyle.themeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    try {
      XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 1800,
        maxWidth: 1800,
      );

      if (file != null) {
        setState(() {
          imageFiles.add(File(file.path));
        });
        Get.snackbar('Success', 'File uploaded successfully');
      }
    } catch (e) {
      print("Error picking image: $e");
      Get.snackbar('Error', 'File upload failed');
    }
  }

  selectFileFromCamera() async {
    try {
      XFile? file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1800,
        maxWidth: 1800,
      );
      if (file != null) {
        setState(() {
          imageFiles.add(File(file.path)); // Add the new image to the list
        });
        Get.snackbar('Success', 'File uploaded successfully');
      }
    } catch (e) {
      print("Error picking image: $e");
      Get.snackbar('Error', 'File upload failed');
    }
  }

  _buildGrid({required List<File> imageFiles}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                // imageFiles.removeAt(index);
              });
            },
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      imageFiles[index],
                      height: 100,
                    )),
              ],
            ),
          ),
          itemCount: imageFiles.length,
          shrinkWrap: true,
        )
      ],
    );
  }
}
