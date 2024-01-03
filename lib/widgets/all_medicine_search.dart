import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Views/medicine_details_view.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import 'custom_card.dart';

class SearchAllMedicines extends SearchDelegate {
  List? filter;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    filter = AllApiCubit.get(context)
        .allMedicineModel
        ?.data
        ?.where((element) =>
            element.scientificName!.toLowerCase().contains(query) ||
            element.tradeName!.toLowerCase().contains(query))
        .toList();
    return GridView.builder(
      itemCount: filter!.length,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20, // x
        mainAxisSpacing: 0, // y
      ),
      itemBuilder: (context, index) {
        return CustomCard(
          Name: '${filter?[index].scientificName}',
          medicinePrice: '${filter?[index].price}',
          medicineQuantity: '${filter?[index].quantity}',
          // photo: '${cubit.allMedicineModel?.data?[index].photo}',
          id: index,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MedicineDetailsView(index: index)),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    if (query == '') {
      return GridView.builder(
        itemCount: cubit.allMedicineModel?.data?.length,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          //     crossAxisSpacing: 10, // x
          //  mainAxisSpacing: 100,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (context, index) {
          return CustomCard(
            Name: '${cubit.allMedicineModel?.data?[index].scientificName}',
            medicinePrice: '${cubit.allMedicineModel?.data?[index].price}',
            medicineQuantity:
                '${cubit.allMedicineModel?.data?[index].quantity}',
            // photo: '${cubit.allMedicineModel?.data?[index].photo}',
            id: index,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MedicineDetailsView(index: index)),
              );
            },
          );
        },
      );
    } else {
      filter = AllApiCubit.get(context)
          .allMedicineModel
          ?.data
          ?.where((element) =>
              element.scientificName!.toLowerCase().contains(query) ||
              element.tradeName!.toLowerCase().contains(query))
          .toList();
      return GridView.builder(
        itemCount: filter!.length,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20, // x
          mainAxisSpacing: 0, // y
        ),
        itemBuilder: (context, index) {
          return CustomCard(
            Name: '${filter?[index].scientificName}',
            medicinePrice: '${filter?[index].price}',
            medicineQuantity: '${filter?[index].quantity}',
            // photo: '${cubit.allMedicineModel?.data?[index].photo}',
            id: index,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MedicineDetailsView(index: index)),
              );
            },
          );
        },
      );
    }
  }
}
