import 'dart:io';
import 'package:firstdose_user/Controller/UploadPrescriptionController.dart';
import 'package:firstdose_user/Data/AppDiaLogs.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Dashboard/Upload/PlaceOrderPrescription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Data/AppButton.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({super.key});

  @override
  State<UploadPrescription> createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  final UploadPrescriptionController uploadPrescriptionController =
      Get.put(UploadPrescriptionController());
  final formKey = GlobalKey<FormState>();
  List<File> imageFiles = [];

  @override
  void initState() {
    // TODO: implement initState
    // uploadPrescriptionController.uploadPrep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Upload Prescription',
        isLeading: false,
        isCartIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.36,
                width: Get.width * 0.70,
                child: Image.asset(
                  ImageStyle.uploadPrescriptionIcon,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: selectImage,
                    child: Image.asset(
                      ImageStyle.gallery,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  InkWell(
                    onTap: selectFileFromCamera,
                    child: Image.asset(
                      ImageStyle.camera,
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // _buildGrid(imageFiles: imageFiles),
              Obx(
                () => (uploadPrescriptionController.imageList.length == 0)
                    ? SizedBox.shrink()
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            uploadPrescriptionController.imageList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1,
                            // mainAxisExtent: 100,
                            crossAxisCount: 3),
                        itemBuilder: (context, index) => Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 100,
                                  width: Get.width * 0.30,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image.file(
                                        fit: BoxFit.fill,
                                        File(uploadPrescriptionController
                                            .imageList[index].path)),
                                  ),
                                ),
                                Positioned(
                                    top: -10,
                                    right: -10,
                                    child: InkWell(
                                      onTap: () {
                                        uploadPrescriptionController.imageList
                                            .removeAt(index);
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorStyle.themeColor),
                                      ),
                                    )),
                              ],
                            )),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: formKey,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: ColorStyle.themeColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    maxLines: 5,
                    controller: uploadPrescriptionController.messageTextFiled.value,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == '') {
                        return "This filed can't be empty";
                      } else {
                        return null;
                      }
                    },
                    style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      hintText: 'Type Message',
                      hintStyle: CustomTextStyles.poppinsRegularCustom(
                          fontSize: 14, color: ColorStyle.grey7E8494),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: Get.height * 0.02,
              ),
              InkWell(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    if (uploadPrescriptionController.imageList.length != 0) {

                        Get.to(() => PlaceOrderPrescription() , arguments: [
                            uploadPrescriptionController.imageList,
                            uploadPrescriptionController.messageTextFiled.value.text
                        ]);

                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Get.snackbar(
                          'Alert', 'Upload a prescription to place order.',
                          colorText: Colors.white,
                          backgroundColor: ColorStyle.themeColor);
                    }
                  }
                },
                child: AppButton(
                  buttoncolor:  ColorStyle.themeColor,
                  buttonfontcolor:  ColorStyle.whitecolor,
                  buttontext: 'Next',
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 2),
              //   child: TextFormField(
              //     maxLines: 5,
              //     decoration: InputDecoration(
              //       // contentPadding: EdgeInsets.symmetric(vertical: 40.0),
              //       hintText: 'Your Message',
              //       hintStyle: GoogleFonts.poppins(
              //         fontSize: 18,
              //         fontWeight: FontWeight.w600,
              //         color: ColorStyle.themeColor,
              //       ),
              //
              //       fillColor: Colors.white,
              //       filled: true,
              //       contentPadding: EdgeInsets.all(16),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //         borderSide:
              //             BorderSide(color: ColorStyle.blackcolor, width: 0.5),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //         borderSide:
              //             BorderSide(color: ColorStyle.blackcolor, width: 0.5),
              //       ),
              //     ),
              //     style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   // padding: EdgeInsets.symmetric(horizontal: 10),
              //   width: Get.width,
              //   height: 56,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (uploadPrescriptionController.imageList.isEmpty) {
              //         return Appdialogs.showToast('Uplaod Prescription');
              //       } else {
              //         Get.to(() => PlaceOrderPrescription());
              //       }
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: ColorStyle.themeColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     child: Text(
              //       "Next",
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white, // Text color
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: Get.height * 0.03,
              // )
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
        // if (imageSelected != null) {
        uploadPrescriptionController.imageList.insert(
            uploadPrescriptionController.imageList.length, File(file.path));
        for (var items in uploadPrescriptionController.imageList)
          debugPrint(items.path.toString());
        // setState(() {
        //   imageFiles.add(File(file.path));
        // });
        // Get.snackbar('Success', 'File uploaded successfully');
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
        // if (imageSelected != null) {
        uploadPrescriptionController.imageList.insert(
            uploadPrescriptionController.imageList.length, File(file.path));
        for (var items in uploadPrescriptionController.imageList)
          debugPrint(items.path.toString());
        // setState(() {
        //   imageFiles.add(File(file.path));
        // });
        // Get.snackbar('Success', 'File uploaded successfully');
      }
    } catch (e) {
      print("Error picking image: $e");
      Get.snackbar('Error', 'File upload failed');
    }
  }

  _buildGrid({required List<File> imageFiles}) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: imageFiles.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
            // mainAxisExtent: 100,
            crossAxisCount: 3),
        itemBuilder: (context, index) => Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100,
                  width: Get.width * 0.30,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.file(
                      fit: BoxFit.fill,
                      imageFiles[index],
                    ),
                  ),
                ),
                Positioned(
                    top: -10,
                    right: -10,
                    child: InkWell(
                      onTap: () => setState(() {
                        imageFiles.removeAt(index);
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorStyle.themeColor),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ));
  }
}
