import 'package:flutter/material.dart';
import 'package:repomed/constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../widgets/all_medicine_search.dart';
import '../widgets/custom_card.dart';
import '../widgets/grid_view_Card.dart';
import '../widgets/custom_slide.dart';
import 'medicine_details_view.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({Key? key}) : super(key: key);
  static String id = 'MedicinePage';
  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: CustomSlide()),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: SearchAllMedicines(),
                            );
                          },
                          icon: Icon(
                            Icons.search_outlined,
                            size: 30,
                            color: kPrimaryColor,
                          )),
                    ],
                  )),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Adjust the crossAxisCount as needed
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CustomCard(
                          Name:
                              '${cubit.allMedicineModel?.data?[index].scientificName}',
                          medicinePrice:
                              '${cubit.allMedicineModel?.data?[index].price}',
                          medicineQuantity:
                              '${cubit.allMedicineModel?.data?[index].quantity}',
                          // photo: '${cubit.allMedicineModel?.data?[index].photo}',
                          id: index,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MedicineDetailsView(index: index)),
                            );
                          },
                        );
                      },
                      childCount: cubit.allMedicineModel?.data?.length,
                    ),
                  ),
                  // GridViewCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
