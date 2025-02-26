import 'package:firstdose_user/Controller/ProductDetailController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Dashboard/Products/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../Controller/SearchController.dart';
import '../../../Styles/ColorStyle.dart';
import '../../../Styles/CustomTextStyles.dart';

class SearchMedicine extends StatefulWidget {
  const SearchMedicine({super.key});

  @override
  State<SearchMedicine> createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  final controller = Get.put(SearchMedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Search Medicine',
        isCartIcon: true,
        isLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomSearchBar(
                leading: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search medicines...",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  height: 1.5,
                ),
                onChanged: (text) async {
                  if (text.isNotEmpty) {
                    await controller.searchMedicine(text);
                  } else {
                    controller.hasSearched.value = false;
                    controller.model.value.data?.clear();

                  }
                },
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorStyle.themeColor,
                        // strokeCap: StrokeCap.butt,
                      ),
                    );
                  }
                  if (!controller.hasSearched.value) {
                    return Center(
                      // child: Text(
                      //   "Start Searching",
                      //   style:
                      //       CustomTextStyles.poppinsRegularBlack(fontSize: 16),
                      // ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Lottie.asset('assets/lottie/noMedicineFound.json'),
                            Text(
                              'Start Searching',
                              style: CustomTextStyles.poppinsRegularBlack(
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (controller.model.value.data?.isEmpty ?? true) {
                    return Center(
                      child: Text(
                        "No results found",
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.model.value.data!.length,
                    itemBuilder: (context, index) {
                      final medicine = controller.model.value.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            leading: medicine.images != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      medicine.images!,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.medical_services,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                            title: Text(
                              medicine.name ?? 'Unknown',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () {
                              Get.to(() => ProductDetails(), arguments: {
                                'productID': medicine.id.toString(),
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
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
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;

  const CustomSearchBar({
    super.key,
    required this.leading,
    required this.hintText,
    required this.hintStyle,
    required this.onChanged,

    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (){
            // textEditingController.value.
            // TextEditingController().value ='' as TextEditingValue;
            textEditingController.clear();
            onChanged('');
          },
          icon: Icon(Icons.clear),
        ),
        prefixIcon: leading,
        hintText: hintText,
        hintStyle: hintStyle,
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
