import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/widgets/category_card.dart';
import 'package:repomed/widgets/custom_button.dart';
import 'package:repomed/widgets/custom_text_form_field.dart';
import 'package:repomed/widgets/left_slide.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/add_medicine_view_body.dart';
import '../widgets/custom_Text_Field.dart';
import '../widgets/textFiledPickedDate.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);
  static String id = 'Category View';
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  bool isLoading = false;
  String? categoryName;
  void _showCategoryAddedSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Category added successfully!'),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return BlocConsumer<AllApiCubit, AllApiState>(
        listener: (context, state) {
          if (state is AddCategoryLoading) {
            isLoading = true;
          } else if (state is AddCategorySuccess) {
            _showCategoryAddedSnackBar(context);
            isLoading = false;
          } else if (state is AddCategoryFailure) {
            showSnakbar(context, state.errMessage);
            isLoading = false;
          }
        },
        builder: (context, state) => BlurryModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              body: Row(
                children: [
                  Expanded(flex: 1, child: LeftSlideContainer()),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomScrollView(
                          physics: BouncingScrollPhysics(),
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
                                        labelText: 'Add New Category',
                                        onChanged: (value) {
                                          categoryName = value;
                                        },
                                      ),
                                    ),
                                    SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 600,
                                    ),
                                    Icon(
                                      Icons.search,
                                      color: kPrimaryColor,
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    4, // Adjust the crossAxisCount as needed
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return CategoryCard(
                                    image: AssetImage(
                                        'assets/images/backgrounds/backGrounds.jpg'),
                                    categoryName:
                                        '${cubit.categoryModel?.data?[index].name}',
                                    onTap: () {},
                                  );
                                },
                                childCount: cubit.categoryModel?.data?.length,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )));
  }
}
