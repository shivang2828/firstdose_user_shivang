import 'package:firstdose_user/Models/DashBoardModel.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Dashboard/Products/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Controller/HomeScreenController.dart';

// import '../../../Models/CategoriesModel.dart';
import '../../../Styles/CustomTextStyles.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final controller = Get.put(DashBoardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.dashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appbarTitle: 'Category',
          isCartIcon: true,
           isLeading: true,

      ),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                _buildGrid(
                    data: controller.dashboardModel.value.data!.categories!),
              ],
            ),
          )),
    );
  }

  _buildGrid({required List<Categories> data}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              physics: AlwaysScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
                // childAspectRatio: 2

              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to( () =>   Product(), arguments: [
                    data[index].name,
                    data[index].id,
                  ]
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data[index].image!,
                          height: 60,
                        )),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        data[index].name!,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.poppinsBoldBlack(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: data.length,
              primary: false,
              // shrinkWrap: false,
            ),
          )
        ],
      ),
    );
  }
}
