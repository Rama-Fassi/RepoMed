import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/widgets/custom_text_form_field.dart';
import 'package:repomed/widgets/textFiledPickedDate.dart';

import '../constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import 'custom_Text_Field.dart';
import 'custom_button.dart';

class AddMedicineViewBody extends StatefulWidget {
  AddMedicineViewBody({
    super.key,
  });

  @override
  State<AddMedicineViewBody> createState() => _AddMedicineViewBodyState();
}

class _AddMedicineViewBodyState extends State<AddMedicineViewBody> {
  String? categoryName;
  String? scientificName;

  String? tradeName;

  String? companyName;

  String? categoriesName;

  String? quantity;

  String? expirationAt;

  String? price;

  String? form;

  String? details;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter The Medicine Details',
                style: TextStyle(
                    fontSize: 30,
                    color: kLogoColor1,
                    fontWeight: FontWeight.bold),
              ),
              kSizedBox,
              CustomTextFormField(
                onChanged: (value) {
                  categoryName = value;
                },
                labelText: 'Category Name',
                icon: Icons.text_fields,
              ),
              kSizedBox,
              CustomTextFormField(
                onChanged: (value) {
                  scientificName = value;
                },
                labelText: 'Scientific Name',
                icon: Icons.text_fields,
              ),
              kSizedBox,
              CustomTextFormField(
                  onChanged: (value) {
                    tradeName = value;
                  },
                  labelText: 'Trade Name'),
              kSizedBox,
              CustomTextFormField(
                  onChanged: (value) {
                    categoriesName = value;
                  },
                  labelText: 'Medicine Category'),
              kSizedBox,
              CustomTextFormField(
                  onChanged: (value) {
                    companyName = value;
                  },
                  labelText: 'The Manufacture Company'),
              kSizedBox,
              CustomTextFormField(
                onChanged: (value) {
                  quantity = value;
                },
                labelText: 'Quantity',
                inputType: TextInputType.number,
              ),
              kSizedBox,
              // TextFiledPickedDate(
              //   onChanged: (value) {
              //     expirationAt = value as DateTime;
              //   },
              // ),
              CustomTextFormField(
                  inputType: TextInputType.datetime,
                  onChanged: (value) {
                    expirationAt = value;
                  },
                  labelText: 'expiration time'),
              kSizedBox,
              CustomTextFormField(
                  onChanged: (value) {
                    price = value;
                  },
                  labelText: 'The Price'),
              kSizedBox,

              CustomTextFormField(
                  onChanged: (value) {
                    form = value;
                  },
                  labelText: 'Form'),
              kSizedBox,

              CustomTextFormField(
                  onChanged: (value) {
                    details = value;
                  },
                  labelText: 'Details'),
              kSizedBox,
              Center(
                child: CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AllApiCubit>(context).addMedicine(
                          context: context,
                          scientificName: scientificName!,
                          tradeName: tradeName!,
                          companyName: companyName!,
                          categoriesName: categoriesName!,
                          quantity: quantity!,
                          expirationAt: expirationAt!,
                          price: price!,
                          form: form!,
                          details: details!,
                          categoryName: categoryName!);
                    } else {}
                  },
                  text: 'Add Medicine',
                  width: 200,
                  borderRadius: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
