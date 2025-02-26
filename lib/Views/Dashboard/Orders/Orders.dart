import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:pinch_zoom/pinch_zoom.dart';
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

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.Page.value = 1;
      scrollController.addListener(pagination);
      checkLoginStatus();
    });

    // TODO: implement initState
    super.initState();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   checkLoginStatus();
  // }

  void pagination() {
    if (controller.orderModel.value.data!.length <
        controller.orderModel.value.total_data!) {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        controller.Page.value++;
        controller.order();
      }
    }
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
  build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(appbarTitle: 'Orders'),
        body: Obx(() {
          if (controller.processing.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.themeColor,
                // size: 50.0,
              ),
            );
          } else if (controller.orderModel.value.data == null ||
              controller.orderModel.value.data!.length == 0) {
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
                          listContainer(),
                        ],
                      )),
                ),
              ],
            );
          }
        }));
  }

  // listContainer({required List<Data> data}) {
  //   final data = controller.orderModel.value.data!;
  //
  //   return Expanded(
  //     child: ListView.builder(
  //       padding: const EdgeInsets.all(8),
  //       shrinkWrap: true,
  //       // physics: NeverScrollableScrollPhysics(),
  //       itemCount: data.length,
  //       itemBuilder: (context, index) {
  //         String jsonDate = '${data[index].createdAt}';
  //         DateTime dateTime = DateTime.parse(jsonDate);
  //         String formattedDate = DateFormat("dd MMMM yyyy").format(dateTime);
  //
  //         return InkWell(
  //           onTap: () {
  //             if (data[index].orderType == 'normal') {
  //               Get.to(() => OrderDetails(), arguments: {
  //                 'orderNumber': data[index].id.toString(),
  //               });
  //             }
  //           },
  //           child: Container(
  //             // alignment: Alignment.center,
  //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             width: Get.width,
  //             child: Column(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(children: [
  //                           Text(
  //                             'Order #${data[index].id}',
  //                             style: GoogleFonts.poppins(
  //                                 fontWeight: FontWeight.bold),
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           data[index].orderType == 'normal'
  //                               ? ClipRRect(
  //                             borderRadius: BorderRadius.circular(70),
  //                             clipBehavior: Clip.antiAlias,
  //                             child: Image.asset(
  //                               ImageStyle.nomalOrder,
  //                               height: 20,
  //                             ),
  //                           )
  //                               : ClipRRect(
  //                             borderRadius: BorderRadius.circular(70),
  //                             clipBehavior: Clip.antiAlias,
  //                             child: Image.asset(
  //                               ImageStyle.prescriptionOrder,
  //                               height: 20,
  //                             ),
  //                           )
  //                         ]),
  //                         (controller.orderModel.value.data![index]
  //                             .paymentStatus ==
  //                             'pending')
  //                             ? Text(
  //                           'Payment Pending',
  //                           style: GoogleFonts.poppins(
  //                             fontWeight: FontWeight.w500,
  //                             color: ColorStyle.yellowFFC22E,
  //                           ),
  //                         )
  //                             : Text(
  //                           'Payment Approved',
  //                           style: GoogleFonts.poppins(
  //                             fontWeight: FontWeight.w500,
  //                             color: ColorStyle.green20AF0B,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           formattedDate,
  //                           style: GoogleFonts.poppins(
  //                               fontWeight: FontWeight.w500,
  //                               color: ColorStyle.black2C2C2C),
  //                         ),
  //                         (controller.orderModel.value.data![index]
  //                             .paymentStatus ==
  //                             'pending')
  //                             ? Text(
  //                           'Order Pending',
  //                           style: GoogleFonts.poppins(
  //                             fontWeight: FontWeight.w500,
  //                             color: ColorStyle.yellowFFC22E,
  //                           ),
  //                         )
  //                             : Text(
  //                           'Order Accepted',
  //                           style: GoogleFonts.poppins(
  //                             fontWeight: FontWeight.w500,
  //                             color: ColorStyle.green20AF0B,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Divider(
  //                   color: ColorStyle.greycolor,
  //                   thickness: 0.5,
  //                 ),
  //                 if (data[index].orderType == 'normal')
  //                   ListView.builder(
  //                     physics: NeverScrollableScrollPhysics(),
  //                     itemBuilder: (context, index1) =>
  //                         Text(
  //                           '${data[index].orderItem![index1]
  //                               .quantity} X ${data[index].orderItem![index1]
  //                               .product!.name}',
  //                           style: CustomTextStyles.poppinsMediumBlack(
  //                             fontSize: 12,
  //                           ),
  //                         ),
  //                     shrinkWrap: true,
  //                     itemCount: data[index].orderItem!.length,
  //                   )
  //                 else
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         '${data[index].prescription!.message}',
  //                         style: CustomTextStyles.poppinsMediumBlack(
  //                           fontSize: 12,
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       GridView.builder(
  //                         physics: NeverScrollableScrollPhysics(),
  //                         itemCount: data[index].prescription!.files!.length,
  //                         shrinkWrap: true,
  //                         gridDelegate:
  //                         SliverGridDelegateWithFixedCrossAxisCount(
  //                             crossAxisSpacing: 20,
  //                             mainAxisSpacing: 20,
  //                             childAspectRatio: 1,
  //                             // mainAxisExtent: 100,
  //                             crossAxisCount: 3),
  //                         itemBuilder: (context, indexNum) =>
  //                             InkWell(
  //                               onTap: () {
  //                                 showDialogeBoxCustom(
  //                                     PinchZoom(
  //                                       maxScale: 2.5,
  //                                       zoomEnabled: true,
  //                                       child: CachedNetworkImage(
  //                                         progressIndicatorBuilder:
  //                                             (context, url, progress) =>
  //                                             Container(
  //                                               alignment: Alignment.center,
  //                                               height: Get.height * 0.60,
  //                                               width: Get.width,
  //                                               color: Colors.transparent,
  //                                               child: CircularProgressIndicator(
  //                                                 color: ColorStyle.themeColor,
  //                                               ),
  //                                             ),
  //                                         imageUrl:
  //                                         '${data[index].prescription!
  //                                             .files![indexNum]}',
  //                                         fit: BoxFit.fill,
  //                                       ),
  //                                     ),
  //                                     context);
  //                               },
  //                               child: Container(
  //                                 margin: EdgeInsets.symmetric(horizontal: 5),
  //                                 decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     border: Border.all(
  //                                         color: ColorStyle.greyD9D9D9,
  //                                         width: 1)),
  //                                 height: 50,
  //                                 width: 90,
  //                                 child: CachedNetworkImage(
  //                                   height: 50,
  //                                   progressIndicatorBuilder:
  //                                       (context, url, progress) =>
  //                                       Image.asset(
  //                                         ImageStyle.placeHolderImage,
  //                                         fit: BoxFit.fill,
  //                                       ),
  //                                   imageUrl:
  //                                   '${data[index].prescription!
  //                                       .files![indexNum]}',
  //                                   fit: BoxFit.fill,
  //                                 ),
  //                               ),
  //                             ),
  //                       ),
  //                     ],
  //                   ),
  //                 data[index].orderType == 'normal'
  //                     ? Column(
  //                   children: [
  //                     Divider(
  //                       color: ColorStyle.greycolor,
  //                       thickness: 0.5,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           "Order Amount",
  //                           style: GoogleFonts.poppins(
  //                               fontWeight: FontWeight.w500,
  //                               color: ColorStyle.black2C2C2C),
  //                         ),
  //                         Text(
  //                           '${data[index].orderSubTotal}',
  //                           style: GoogleFonts.poppins(
  //                               fontWeight: FontWeight.w500,
  //                               color: ColorStyle.black2C2C2C),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 )
  //                     : SizedBox.shrink(),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget listContainer() {
    return Obx(() {
      // final List<OrderData> orders = controller.orderModel.value.data! ;
      final List<OrderData> orders =
          controller.orderModel.value.data!.cast<OrderData>();

      return Expanded(
        child: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            String jsonDate = '${order.createdAt}';
            DateTime dateTime = DateTime.parse(jsonDate);
            String formattedDate = DateFormat("dd MMMM yyyy").format(dateTime);

            return InkWell(
              onTap: () {
                if (order.order_type == 'normal') {
                  Get.to(() => OrderDetails(), arguments: {
                    'orderNumber': order.id.toString(),
                  });
                }
              },
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
                    // Top row: Order number and type icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Order #${order.id}',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Show different image based on order type
                            ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.asset(
                                order.order_type == 'normal'
                                    ? ImageStyle.nomalOrder
                                    : ImageStyle.prescriptionOrder,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        // Payment status text
                        Text(
                          order.paymentStatus == 'pending'
                              ? 'Payment Pending'
                              : 'Payment Approved',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: order.paymentStatus == 'pending'
                                ? ColorStyle.yellowFFC22E
                                : ColorStyle.green20AF0B,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Second row: Date and order status
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
                        Text(
                          order.paymentStatus == 'pending'
                              ? 'Order Pending'
                              : 'Order Accepted',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: order.paymentStatus == 'pending'
                                ? ColorStyle.yellowFFC22E
                                : ColorStyle.green20AF0B,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: ColorStyle.greycolor, thickness: 0.5),
                    // Conditional UI based on order type
                    order.order_type == 'normal'
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: order.orderItem?.length ?? 0,
                            itemBuilder: (context, index1) {
                              return Text(
                                '${order.orderItem![index1].quantity} X ${order.orderItem![index1].product!.name}',
                                style: CustomTextStyles.poppinsMediumBlack(
                                  fontSize: 12,
                                ),
                              );
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${order.prescription!.message}',
                                style: CustomTextStyles.poppinsMediumBlack(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: order.prescription!.files!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, indexNum) {
                                  return InkWell(
                                    onTap: () {
                                      showDialogeBoxCustom(
                                        PinchZoom(
                                          maxScale: 2.5,
                                          zoomEnabled: true,
                                          child: CachedNetworkImage(
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    Container(
                                              alignment: Alignment.center,
                                              height: Get.height * 0.60,
                                              width: Get.width,
                                              color: Colors.transparent,
                                              child: CircularProgressIndicator(
                                                color: ColorStyle.themeColor,
                                              ),
                                            ),
                                            imageUrl:
                                                '${order.prescription!.files![indexNum]}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        context,
                                      );
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: ColorStyle.greyD9D9D9,
                                            width: 1),
                                      ),
                                      height: 50,
                                      width: 90,
                                      child: CachedNetworkImage(
                                        height: 50,
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                Image.asset(
                                          ImageStyle.placeHolderImage,
                                          fit: BoxFit.fill,
                                        ),
                                        imageUrl:
                                            '${order.prescription!.files![indexNum]}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                    // Show order amount for normal orders
                    order.order_type == 'normal'
                        ? Column(
                            children: [
                              Divider(
                                  color: ColorStyle.greycolor, thickness: 0.5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order Amount",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: ColorStyle.black2C2C2C),
                                  ),
                                  Text(
                                    '${order.orderSubTotal}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: ColorStyle.black2C2C2C),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  customSearchBar() {
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

  showDialogeBoxCustom(Widget widget, BuildContext context) {
    // this.widget;
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(left: 0.0, right: 0.0),
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8.0, top: 16.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: widget),
                    Positioned(
                      right: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 14.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.close,
                              color: ColorStyle.themeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
