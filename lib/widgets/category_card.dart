import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/constants.dart';

import '../Views/medicine_category_view.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    this.image,
    required this.categoryName,
    required this.id,
  });
  final AssetImage? image;
  final String categoryName;
  final int? id;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is MedicineLoading) {
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
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<AllApiCubit>(context).medicine(context, id: id!);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                width: 250,
                height: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(image: image!, fit: BoxFit.fill),
                    border: Border.all(color: kPrimaryColor, width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      categoryName,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
