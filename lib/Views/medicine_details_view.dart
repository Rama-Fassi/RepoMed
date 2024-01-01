import 'package:flutter/material.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/widgets/custom_button.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../widgets/custom_medicine_details.dart';
import '../widgets/custom_slide.dart';

class MedicineDetailsView extends StatelessWidget {
  static String id = 'MedicineDetail';

  MedicineDetailsView({super.key, this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    cubit.getAllMedicine(context);
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
                          Text(S.of(context).Medicine_Details,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                          const SizedBox(height: 35),
                          CustomDetail(
                              text:
                                  '${S.of(context).Scientific_Name}: ${cubit.allMedicineModel?.data?[index!].scientificName}',
                              index: index,
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).Trade_Name}: ${cubit.allMedicineModel?.data?[index!].tradeName}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).Medicine_Category}: ${cubit.allMedicineModel?.data?[index!].categoriesName}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).Quantity}: ${cubit.allMedicineModel?.data?[index!].quantity}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).The_Manufacture_Company}: ${cubit.allMedicineModel?.data?[index!].companyName}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).The_Price}: ${cubit.allMedicineModel?.data?[index!].price}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).expiration_time}: ${cubit.allMedicineModel?.data?[index!].expirationAt}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).Form}: ${cubit.allMedicineModel?.data?[index!].form}',
                              width: 600),
                          kSizedBoxless,
                          CustomDetail(
                              index: index,
                              text:
                                  '${S.of(context).description} : ${cubit.allMedicineModel?.data?[index!].details}',
                              width: 600),
                          kSizedBoxless,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  text: S.of(context).Edit,
                                  width: 100,
                                  borderRadius: 8,
                                  padding: 8,
                                  height: 40),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                  text: S.of(context).Delete,
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
