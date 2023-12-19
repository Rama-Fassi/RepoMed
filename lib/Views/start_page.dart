import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/categories_view.dart';
import 'package:repomed/widgets/details_table.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_card_for_getstart.dart';
import '../widgets/left_slide.dart';
import 'add_medicine_view.dart';
import 'all_medicine_view.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);
  static String id = 'GetStartedView';

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AllMedicineLoading) {
          isLoading = true;
        } else if (state is AllMedicineSuccess) {
          Navigator.pushNamed(context, AllMedicineView.id);
          isLoading = false;
        } else if (state is AllMedicineFailur) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        } else if (state is AllMedicineDetailsLoading) {
          isLoading = true;
        } else if (state is AllMedicineDetailsSuccess) {
          Navigator.pushNamed(context, TableWidget.id);
          isLoading = false;
        } else if (state is AllMedicineDetailsFailur) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        } else if (state is AllCategoriesLoading) {
          isLoading = true;
        } else if (state is AllCategoriesSuccess) {
          Navigator.pushNamed(context, CategoriesView.id);
          isLoading = false;
        } else if (state is AllCategoriesFailur) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Row(
              children: [
                Expanded(flex: 1, child: LeftSlideContainer()),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomCardForStartPage(
                                  icon: Icons.add_shopping_cart,
                                  text: 'Add Medicine',
                                  ontap: () {
                                    Navigator.pushNamed(
                                        context, AddMedicineView.id);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: CustomCardForStartPage(
                                  text: 'All Medicines',
                                  icon: Icons.medical_information,
                                  ontap: () {
                                    BlocProvider.of<AllApiCubit>(context)
                                        .allMedicine(context);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: CustomCardForStartPage(
                                  text: 'Categories',
                                  icon: Icons.inventory_outlined,
                                  ontap: () {
                                    BlocProvider.of<AllApiCubit>(context)
                                        .allCategory(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomCardForStartPage(
                                  text: 'All Orders',
                                  icon: Icons.inventory_outlined,
                                  ontap: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: CustomCardForStartPage(
                                  icon: Icons.summarize_outlined,
                                  text: 'Reports',
                                  ontap: () {
                                    Navigator.pushNamed(
                                        context, AddMedicineView.id);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: CustomCardForStartPage(
                                  text: 'Medicines details',
                                  icon: Icons.local_pharmacy_outlined,
                                  ontap: () {
                                    BlocProvider.of<AllApiCubit>(context)
                                        .allMedicineDetails(context);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// drawer: Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: <Widget>[
//       kSizedBox,
//       Container(
//         child: Image.asset('assets/images/Repomed_logo.png'),
//         width: 100,
//         height: 100,
//       ),
//       kSizedBox,
//       ListTile(
//         leading: Icon(Icons.home),
//         title: Text('Home'),
//         onTap: () {
//           // Add your logic for the Home option
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         leading: Icon(Icons.settings),
//         title: Text('Settings'),
//         onTap: () {
//           // Add your logic for the Settings option
//           Navigator.pop(context);
//         },
//       ),
//     ],
//   ),
// ),
