import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstdose_user/Controller/MyCartController.dart';
import 'package:firstdose_user/Data/AppButton.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';

import 'package:firstdose_user/Views/Auth/LoginScreen.dart';
import 'package:firstdose_user/Views/Cart/FinalAmount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/MyCartModel.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/CustomTextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../../Utils/Const.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final controller = Get.put(MyCartController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.myCart();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<MyCartController>();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldbgcolor,
      appBar: CustomAppBar(
        appbarTitle: 'My Cart',
        isLeading: true,
        isCartIcon: false,
      ),
      body: Obx(
        () => (controller.processing.value)
            ? Center(
                child: CircularProgressIndicator(color: ColorStyle.themeColor))
            : (controller.model.value.data == null ||
                    controller.model.value.data!.cartItem!.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(ImageStyle.emptyCartLottie),
                      Text('No items in cart',
                          style: CustomTextStyles.poppinsMediumBlack(
                              fontSize: 18)),
                    ],
                  )
                : RefreshIndicator(
                    onRefresh: () {
                      return controller.myCart();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${controller.model.value.data!.cartItem!.length} items in cart',
                                  style: CustomTextStyles.poppinsMediumBlack(
                                      fontSize: 15)),
                              InkWell(
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('FirstDose',
                                        style: GoogleFonts.poppins(
                                          color: ColorStyle.black2C2C2C,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    content: Text(
                                        'Are you Sure, want to Clear Your Cart?',
                                        style: GoogleFonts.poppins(
                                          color: ColorStyle.black2C2C2C,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: Text('Cancel',
                                            style: GoogleFonts.poppins(
                                              color: ColorStyle.themeColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await controller.updateCart(
                                              flag: 'clear_cart',
                                              productId: '',
                                              quantity: '');
                                          Get.back();
                                        },
                                        child: Text('OK',
                                            style: GoogleFonts.poppins(
                                              color: ColorStyle.themeColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                // onTap: () => controller.updateCart(flag: 'clear_cart', productId: '', quantity: ''),
                                child: Text('Clear cart',
                                    style: CustomTextStyles.poppinsMediumCustom(
                                        color: ColorStyle.redFF3B2D,
                                        fontSize: 15)),
                              ),
                            ],
                          ),
                          // Cart items list
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true, // Add this
                                      itemCount: controller
                                          .model.value.data!.cartItem!.length,
                                      itemBuilder: (context, index) =>
                                          listViewContainer(
                                              data: controller.model.value.data!
                                                  .cartItem![index]),
                                    ),
                                    SizedBox(height: 10),
                                    // Payment summary

                                    InkWell(
                                      onTap: () {
                                        bottomModelSpreadSheet();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: ColorStyle.themeColor)),
                                        width: Get.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Apply Coupon'),
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ColorStyle.themeColor),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      // color: ColorStyle.themeColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  child: Text("Apply Coupon"),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),

                                    Text(
                                      'Payment Summary',
                                      style:
                                          CustomTextStyles.poppinsSemiBoldBlack(
                                              fontSize: 18),
                                    ),
                                    listPaymentContainer(),
                                    SizedBox(height: 10),

                                    InkWell(
                                      onTap: () {
                                        Get.to(() => FinalAmount());
                                      },
                                      child: AppButton(
                                          buttoncolor: ColorStyle.themeColor,
                                          buttonfontcolor:
                                              ColorStyle.whitecolor,
                                          buttontext: "Checkout"),
                                    ),
                                    SizedBox(height: Get.height * 0.10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  listViewContainer({required CartItem data}) {
    return InkWell(
      onTap: () {
        // Get.to(ProductDetailView(
        //   productName: data.name,
        //   productId: data.id!.toString(),
        // ));
      },
      child: Dismissible(
        key: GlobalKey(),
        onDismissed: (direction) {
          controller.updateCart(
              flag: 'remove_product',
              quantity: data.quantity.value.toString(),
              productId: data.productId.toString());
        },
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.delete,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: Get.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: (data.product!.images == null ||
                        data.product!.images == '')
                    ? Image.asset(ImageStyle.placeHolderImage)
                    : CachedNetworkImage(
                        height: 80,
                        width: 100,
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        imageUrl: data.product!.images!,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Image.asset(ImageStyle.placeHolderImage)),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.product!.name!,
                      style: CustomTextStyles.poppinsRegularBlack(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text('₹ ${data.original_price}',
                            style: GoogleFonts.poppins(
                                decoration: (data.original_price! !=
                                        data.discounted_price)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontWeight: FontWeight.w600,
                                color: ColorStyle.blackcolor,
                                fontSize: 14)
                            // CustomTextStyles.poppinsSemiBoldBlack(fontSize: 14),
                            ),
                        SizedBox(
                          width: 5,
                        ),
                        (data.original_price! != data.discounted_price)
                            ? Text('₹ ${data.discounted_price.toString()}',
                                style: GoogleFonts.poppins(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600,
                                    color: ColorStyle.blackcolor,
                                    fontSize: 14)
                                // CustomTextStyles.poppinsSemiBoldBlack(fontSize: 14),
                                )
                            : SizedBox.shrink(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 30,
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              data.quantity.value--;
                              controller.updateCart(
                                  flag: 'minus',
                                  quantity: data.quantity.value.toString(),
                                  productId: data.productId.toString());
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: ColorStyle.themeColor)),
                              child: Icon(
                                Icons.remove,
                                color: ColorStyle.themeColor,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              '${data.quantity.value}',
                              style: CustomTextStyles.poppinsMediumBlack(
                                  fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              data.quantity.value++;
                              controller.updateCart(
                                flag: 'plus',
                                quantity: data.quantity.value.toString(),
                                productId: data.productId.toString(),
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: ColorStyle.themeColor)),
                              child: Icon(
                                Icons.add,
                                color: ColorStyle.themeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.updateCart(
                      flag: 'remove_product',
                      quantity: data.quantity.value.toString(),
                      productId: data.productId.toString());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.delete,
                    color: ColorStyle.themeColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listPaymentContainer() {
    var payment = controller.model.value.data!.payments!;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      // width: Get.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      height: 100,

      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: payment.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${payment[index].title}',
                  style: CustomTextStyles.poppinsMediumBlack(fontSize: 16),
                ),
                Text(
                  '₹${payment[index].amount}',
                  style: CustomTextStyles.poppinsMediumCustom(
                      fontSize: 16,
                      color: payment[index].title == 'Coupon Discount'
                          ? ColorStyle.themeColor
                          : ColorStyle.black2C2C2C),
                ),
              ],
            );
          }),
    );
  }

  bottomModelSpreadSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: Get.height * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              border: Border.all(color: ColorStyle.themeColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Coupon Available ",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, color: ColorStyle.black2C2C2C),
              )
            ],
          ),
        );
      },
    );
  }
}
