import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/category_medicine_details_view.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_slide.dart';

class CategoryMedicines extends StatelessWidget {
  const CategoryMedicines({Key? key}) : super(key: key);
  static String id = 'CategoryMedicinesView';

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: CustomSlide()),
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: cubit.categorymedicinesModel?.data?.length,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20, // x
                mainAxisSpacing: 0, // y
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  Name:
                      '${cubit.categorymedicinesModel?.data?[index].scientificName}',
                  medicineQuantity:
                      '${cubit.categorymedicinesModel?.data?[index].quantity}',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryMedicineDetailsView(index: index)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
