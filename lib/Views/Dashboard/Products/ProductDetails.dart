import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(8),
           child: SafeArea(
               child: SingleChildScrollView(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
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
                   ],




                 ),
               ),
           ),



      ),
    );
  }
}
