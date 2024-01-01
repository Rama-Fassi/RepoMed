import 'package:flutter/material.dart';
import 'package:repomed/cubits/all_api_cubit/all_api_cubit.dart';
import 'custom_card.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return GridView.builder(
      itemCount: cubit.allMedicineModel?.data?.length,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20, // x
        mainAxisSpacing: 0, // y
      ),
      itemBuilder: (context, index) {
        return CustomCard(
          Name: '${cubit.allMedicineModel?.data?[index].scientificName}',
          medicinePrice: '${cubit.allMedicineModel?.data?[index].price}',
          medicineQuantity: '${cubit.allMedicineModel?.data?[index].quantity}',
          // photo: '${cubit.allMedicineModel?.data?[index].photo}',
          id: index,
        );
      },
    );
  }
}
