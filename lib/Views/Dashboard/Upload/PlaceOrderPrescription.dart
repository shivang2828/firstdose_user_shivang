import 'dart:io';

import 'package:firstdose_user/Controller/AddressController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Controller/UploadPrescriptionController.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../Cart/ShippingInformation.dart';

class PlaceOrderPrescription extends StatefulWidget {
  PlaceOrderPrescription({super.key});

  List<File> imageList = Get.arguments[0];
  var message = Get.arguments[1];
  @override
  State<PlaceOrderPrescription> createState() => _PlaceOrderPrescriptionState();
}

class _PlaceOrderPrescriptionState extends State<PlaceOrderPrescription> {
  // final AddressController controller = Get.put(AddressController());
  final UploadPrescriptionController uploadPrescriptionController =
  Get.put(UploadPrescriptionController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadPrescriptionController.addressController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: "Place Order",
        isLeading: true,
        isCartIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select a Delivery Address',
                      style: CustomTextStyles.poppinsMediumBlack(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ShippingInformation());
                      },
                      child: Text(
                        'Add new address',
                        style: CustomTextStyles.poppinsRegularTheme(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (uploadPrescriptionController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorStyle.themeColor,
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: uploadPrescriptionController.addressModel.value.data!.length,
                    itemBuilder: (context, index) {
                      var data = uploadPrescriptionController.addressModel.value.data![index];
                      return Obx(
                        () => Container(
                          // padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: (uploadPrescriptionController.selectedAddress.value ==
                                          index)
                                      ? ColorStyle.themeColor
                                      : ColorStyle.greyD9D9D9,
                                  width: 1)),
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            activeColor: ColorStyle.themeColor,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name!.toString(),
                                  style: CustomTextStyles.poppinsSemiBoldBlack(
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  (data.fullAddress == null ||
                                          data.fullAddress!.isEmpty)
                                      ? ''
                                      : data.fullAddress! +
                                          ' , ' +
                                          data.city! +
                                          ' , ' +
                                          data.state! +
                                          ' , ' +
                                          data.pinCode!,
                                  style: CustomTextStyles.poppinsRegularBlack(
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.phoneNumber!.toString(),
                                  style: CustomTextStyles.poppinsSemiBoldBlack(
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            value: index,
                            groupValue: uploadPrescriptionController.selectedAddress.value,
                            onChanged: (value) {
                              uploadPrescriptionController.selectedAddress.value = index;
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    uploadPrescriptionController.uploadPrep(
                        imageList: widget.imageList,
                        message: widget.message
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorStyle.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "Place Order",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
               SizedBox(height: Get.height*0.03),
            ],
          ),
        ),
      ),
    );
  }
}
