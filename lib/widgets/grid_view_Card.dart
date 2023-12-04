import 'package:flutter/material.dart';
import 'package:repomed/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:repomed/services/get_all_medicine_service.dart';

import 'custome_card.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return GridView.builder(
      itemCount: cubit.allMedicineModel?.data?.length,
      padding: EdgeInsets.symmetric(horizontal: 50),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20, // x
        mainAxisSpacing: 0, // y
      ),
      itemBuilder: (context, index) {
        return CustomeCard(
          medicineName:
              '${cubit.allMedicineModel?.data?[index].scientificName}',
        );
      },
    );
  }
}
