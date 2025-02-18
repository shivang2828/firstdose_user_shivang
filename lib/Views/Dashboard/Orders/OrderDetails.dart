import 'package:firstdose_user/Controller/OrderDetailController.dart';
import 'package:firstdose_user/Models/OrderDetailModel.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';
import '../../../Styles/ImageStyle.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late String orderNumber;
  final controller = Get.put(OrderDetailController());

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments;
    orderNumber = args['orderNumber'];
    controller.orderDetail(orderNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Order #$orderNumber',
        isCartIcon: false,
        isLeading: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorStyle.themeColor,
            ),
          );
        } else if (controller.orderDetailModel.value.data == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorStyle.themeColor.withOpacity(0.78),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        listContainer(
                          data: controller
                              .orderDetailModel.value.data!.orderItem!,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: Get.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Amount',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorStyle.greycolor,
                                thickness: 0.5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sub Total',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '₹${controller.orderDetailModel.value.data!.orderSubTotal}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorStyle.greycolor,
                                thickness: 0.5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Grand Total',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '₹${controller.orderDetailModel.value.data!.orderTotal}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: Get.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vendor Details',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorStyle.greycolor,
                                thickness: 0.5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  (controller.orderDetailModel.value.data!
                                              .merchantDetail ==
                                          null)
                                      ? Expanded(
                                          child: Text(
                                            'Order is not accepted yet,Someone will accept it shortly',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: ColorStyle.grey7E8494),
                                          ),
                                        )
                                      : Text(
                                          '₹${controller.orderDetailModel.value.data!.merchantDetail}',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  Widget listContainer({required List<OrderItem> data}) {
    final orderItem = controller.orderDetailModel.value.data!.orderItem!;
    final data = controller.orderDetailModel.value.data!;
    // return ListView.builder(
    //   padding: const EdgeInsets.all(8),
    //   shrinkWrap: true,
    //   itemCount: data.length,
    //   itemBuilder: (context, index) {
    String jsonDate = data.createdAt ?? "";
    DateTime dateTime = DateTime.tryParse(jsonDate) ?? DateTime.now();
    String formattedDate = DateFormat("dd MMMM yyyy").format(dateTime);

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: Get.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Order #${data.id}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        ImageStyle.nomalOrder,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                (controller.orderDetailModel.value.data!
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
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: ColorStyle.black2C2C2C,
                  ),
                ),
                (controller.orderDetailModel.value.data!
                    .orderStatus == 'pending')?
                Text(
                  'Order  Pending',
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
                // Text(
                //   'Order Pending',
                //   style: GoogleFonts.poppins(
                //     fontWeight: FontWeight.w500,
                //     color: ColorStyle.yellowFFC22E,
                //   ),
                // ),
              ],
            ),
            Divider(
              color: ColorStyle.greycolor,
              thickness: 0.5,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orderItem.length,
              itemBuilder: (context, itemIndex) {
                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${orderItem[itemIndex].quantity} X ${orderItem[itemIndex].product!.name}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text('₹${orderItem[itemIndex].product!.price}')
                        ]),
                    Divider(
                      color: ColorStyle.greycolor,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
            // Divider(
            //   color: ColorStyle.greycolor,
            //   thickness: 0.5,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Order Amount",
            //       style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w500,
            //         color: ColorStyle.black2C2C2C,
            //       ),
            //     ),
            //     Text(
            //       'price',
            //       style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w500,
            //         color: ColorStyle.black2C2C2C,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
    // },
    // );
  }
}
