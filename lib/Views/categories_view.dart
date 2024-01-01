import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/widgets/category_card.dart';
import 'package:repomed/widgets/custom_text_form_field.dart';
import 'package:repomed/widgets/custom_slide.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/all_categories_search.dart';
import 'medicine_category_view.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);
  static String id = 'Category View';
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  bool isLoading = false;
  String? categoryName;
  //
  // void _showCategoryAddedSnackBar(BuildContext context) {
  //   final snackBar = SnackBar(
  //     content: Text(S.of(context).Category_Added_Successfully),
  //   );
  //
  // }

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AddCategoryLoading) {
          isLoading = true;
        } else if (state is AddCategorySuccess) {
          showSnakbar(context, S.of(context).Category_Added_Successfully);
          isLoading = false;
        } else if (state is AddCategoryFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        } else if (state is MedicineLoading) {
          isLoading = true;
        } else if (state is MedicineSuccess) {
          Navigator.pushNamed(context, CategoryMedicines.id);
          isLoading = false;
        } else if (state is MedicineFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Row(
            children: [
              Expanded(flex: 1, child: CustomSlide()),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 10, bottom: 30, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  labelText: S.of(context).Add_New_Category,
                                  onChanged: (value) {
                                    categoryName = value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AllApiCubit>(context)
                                      .addCategory(
                                          context: context,
                                          categoryName: categoryName!);
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      S.of(context).Add,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 600,
                              ),
                              IconButton(
                                  onPressed: () {
                                    showSearch(
                                      context: context,
                                      delegate: SearchAllCategories(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.search_outlined,
                                    size: 30,
                                    color: kPrimaryColor,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    5, // Adjust the crossAxisCount as needed
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 4 / 2),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return CategoryCard(
                              image: const AssetImage('assets/images/12.jpg'),
                              categoryName:
                                  '${cubit.categoryModel?.data?[index].name}',
                              id: cubit.categoryModel?.data?[index].id,
                            );
                          },
                          childCount: cubit.categoryModel?.data?.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
