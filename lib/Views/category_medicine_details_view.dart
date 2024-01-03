import 'package:flutter/material.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/widgets/custom_button.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../widgets/custom_medicine_details.dart';
import '../widgets/custom_slide.dart';

class CategoryMedicineDetailsView extends StatelessWidget {
  static String id = 'CategoryMedicineDetail';

  CategoryMedicineDetailsView({super.key, this.index});
  int? index;

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
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Medicine_Details".tr(context),
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                          const SizedBox(height: 35),
                          CustomDetail(
                              text:
                                  '${"Scientific_Name".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].scientificName}',
                              index: index,
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"Trade_Name".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].tradeName}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"Medicine_Category".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].categoriesName}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"Quantity".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].quantity}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"The_Manufacture_Company".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].companyName}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"The_Price".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].price}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"expiration_time".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].expirationAt}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"Form".tr(context)}: ${cubit.categorymedicinesModel?.data?[index!].form}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${"description".tr(context)} : ${cubit.categorymedicinesModel?.data?[index!].details}',
                              width: 600),
                          kSizedBoxless,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  text: "Edit".tr(context),
                                  width: 100,
                                  borderRadius: 8,
                                  padding: 8,
                                  height: 40),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                  text: "Delete".tr(context),
                                  width: 100,
                                  borderRadius: 8,
                                  padding: 8,
                                  height: 40),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/img.png',
                          width: 500,
                          height: 500,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
