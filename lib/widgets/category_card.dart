import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/constants.dart';

import '../cubits/all_api_cubit/all_api_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AllApiCubit>(context).medicine(context, id: id!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: image!, fit: BoxFit.fitHeight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
