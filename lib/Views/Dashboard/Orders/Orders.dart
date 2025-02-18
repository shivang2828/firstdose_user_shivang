import 'package:firstdose_user/Models/OrderModel.dart';
import 'package:firstdose_user/Styles/ImageStyle.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Dashboard/Orders/OrderDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/OrderController.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Utils/Const.dart';
import '../../Auth/loginScreen.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final controller = Get.put(OrderController());
  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    isLoggedIn = sharedPref.getBool(isLogin) ?? false;

    if (!isLoggedIn) {
      Get.offAll(() => LoginScreen());
    } else {
      controller.order();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(appbarTitle: 'Orders'),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.themeColor,
                // size: 50.0,
              ),
            );
          } else if (controller.orderModel.value.data == null) {
            return Center(
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/noMedicineFound.json'),
                  Text(
                    'No Order History Found',
                    style: CustomTextStyles.poppinsRegularBlack(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 60,
                  child: customSearchBar(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: ColorStyle.themeColor.withOpacity(0.78),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          )),
                      child: Column(
                        children: [
                          listContainer(
                              data: controller.orderModel.value.data!),
                        ],
                      )),
                ),
              ],
            );
          }
        }));
  }

  Widget listContainer({required List<Data> data}) {
    final data = controller.orderModel.value.data!;

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          String jsonDate = '${data[index].createdAt}';
          DateTime dateTime = DateTime.parse(jsonDate);
          String formattedDate = DateFormat("dd MMMM yyyy").format(dateTime);

          return InkWell(
            onTap: () {
              Get.to(() => OrderDetails(), arguments: {
                'orderNumber': data[index].id.toString(),
              });
            },
            child: Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: Get.width,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                              'Order #${data[index].id}',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                ImageStyle.nomalOrder,
                                height: 20,
                              ),
                            ),
                          ]),
                          (controller.orderModel.value.data![index]
                              .paymentStatus == 'pending')?
                          Text(
                            'Payment Pending',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.yellowFFC22E,
                            ),
                          ):Text(
                            'Payment Approved',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.green20AF0B,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: ColorStyle.black2C2C2C),
                          ),

                          (controller.orderModel.value.data![index]
                              .paymentStatus == 'pending')?
                          Text(
                            'Order Pending',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.yellowFFC22E,
                            ),
                          ):Text(
                            'Order Accepted',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.green20AF0B,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyle.greycolor,
                    thickness: 0.5,
                  ),
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Text(
                  //           '${data[index].orderItem![0].quantity} X ${data[index].orderItem![0].product!.name}',
                  //
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text("1 X Dolo"),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text("1 X Test Product"),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index1) => Text(
                      '${data[index].orderItem![index1].quantity} X ${data[index].orderItem![index1].product!.name}',
                      style: CustomTextStyles.poppinsMediumBlack(
                        fontSize: 12,
                      ),
                    ),
                    shrinkWrap: true,
                    itemCount: data[index].orderItem!.length,
                  ),
                  Divider(
                    color: ColorStyle.greycolor,
                    thickness: 0.5,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Amount",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: ColorStyle.black2C2C2C),
                          ),
                          Text(
                            '${data[index].orderSubTotal}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: ColorStyle.black2C2C2C),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customSearchBar() {
    return TextField(
      // onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: "Search order...",
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
          height: 1.5,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: ColorStyle.blackcolor, width: 0.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}
