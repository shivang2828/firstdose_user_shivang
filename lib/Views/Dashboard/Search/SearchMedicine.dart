
import 'package:firstdose_user/Controller/ProductDetailController.dart';
import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:firstdose_user/Views/Dashboard/Products/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/SearchController.dart';
import '../../../Styles/ColorStyle.dart';

class SearchMedicine extends StatefulWidget {
  const SearchMedicine({super.key});

  @override
  State<SearchMedicine> createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  final SearchMedicineController controller = Get.put(SearchMedicineController());


  @override
  void initState() {
    super.initState();
    controller.textController;
  }

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
                onChanged: (text) => controller.searchMedicine(text),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.model.value.data == null || controller.model.value.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No results found",
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.model.value.data!.length,
                      itemBuilder: (context, index) {
                        final medicine = controller.model.value.data![index];
                        return InkWell(
                          onTap: () {

                            Get.to(() => ProductDetails(), arguments: {
                              // 'product': data[index],
                              'productID': medicine.id.toString(),
                            });
                          },


                          child: Card(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [
                                  medicine.images != null
                                      ? Image.network(
                                    medicine.images!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  )
                                      : Icon(
                                    Icons.medical_services,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        medicine.name ?? 'Unknown',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
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

  const CustomSearchBar({
    super.key,
    required this.leading,
    required this.hintText,
    required this.hintStyle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
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
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}
