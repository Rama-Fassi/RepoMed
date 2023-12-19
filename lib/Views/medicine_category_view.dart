import 'package:flutter/material.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../widgets/custom_card.dart';
import '../widgets/left_slide.dart';

class Medicines extends StatelessWidget {
  const Medicines({Key? key}) : super(key: key);
  static String id = 'MedForCategoryView';
  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: LeftSlideContainer()),
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: cubit.medicineModel?.data?.length,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20, // x
                mainAxisSpacing: 0, // y
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  Name: '${cubit.medicineModel?.data?[index].scientificName}',
                  medicinePrice: '${cubit.medicineModel?.data?[index].price}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
