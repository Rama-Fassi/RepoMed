import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/widgets/custom_text_form_field.dart';
import 'package:repomed/widgets/textFiledPickedDate.dart';
import 'dart:typed_data';
import '../constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import 'custom_button.dart';

class AddMedicineViewBody extends StatefulWidget {
  AddMedicineViewBody({
    super.key,
  });

  @override
  State<AddMedicineViewBody> createState() => _AddMedicineViewBodyState();
}

class _AddMedicineViewBodyState extends State<AddMedicineViewBody> {
  Uint8List? _webImage;

  File? _pickedImage;

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
  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure from medicine details?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
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
                    photo: _webImage,
                  );
                  Navigator.pop(context);
                } else {}
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          children: [
            kSizedBox,
            Text(
              "Enter_The_Medicine_Details".tr(context),
              style: TextStyle(
                  fontSize: 25,
                  color: kLogoColor1,
                  fontWeight: FontWeight.bold),
            ),
            kSizedBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        onChanged: (value) {
                          scientificName = value;
                        },
                        labelText: "Scientific_Name".tr(context),
                      ),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            tradeName = value;
                          },
                          labelText: "Trade_Name".tr(context)),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            categoriesName = value;
                          },
                          labelText: "Medicine_Category".tr(context)),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            companyName = value;
                          },
                          labelText: "The_Manufacture_Company".tr(context)),
                      kSizedBox,
                      CustomTextFormField(
                        onChanged: (value) {
                          quantity = value;
                        },
                        labelText: "Quantity".tr(context),
                        inputType: TextInputType.number,
                      ),
                      kSizedBox,
                      CustomTextFormField(
                          inputType: TextInputType.datetime,
                          onChanged: (value) {
                            expirationAt = value;
                          },
                          labelText: "expiration_time".tr(context)),
                      kSizedBox,
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          onChanged: (value) {
                            price = value;
                          },
                          labelText: "The_Price".tr(context)),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            form = value;
                          },
                          labelText: "Form".tr(context)),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            details = value;
                          },
                          labelText: "Details".tr(context)),
                      kSizedBox,
                      GestureDetector(
                        onTap: () {
                          _pickImage();
                        },
                        child: Container(
                          width: 550,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: kLogoColor1,
                              width: 2,
                            ),
                          ),
                          child: _pickedImage == null
                              ? const Icon(
                                  Icons.image,
                                  size: 80,
                                  color: kLogoColor1,
                                )
                              : kIsWeb
                                  ? Image.memory(
                                      _webImage!,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(_pickedImage!, fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: CustomButton(
                onTap: () {
                  _showBackDialog();
                  TextEditingController().clear();
                },
                text: "Add_Medicine".tr(context),
                width: 200,
                height: 60,
                borderRadius: 15,
                padding: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      if (!kIsWeb) {
        setState(() {
          _pickedImage = File(result.files.single.path!);
        });
      } else {
        Uint8List bytes = result.files.single.bytes!;
        setState(() {
          _webImage = bytes;
          _pickedImage = File("a");
        });
      }
    } else {
      print('No file selected');
    }
  }

  //
  // Future<void> _pickImage() async {
  //   if (!kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var selected = File(image.path);
  //       setState(() {
  //         _pickedImage = selected;
  //       });
  //     } else {
  //       print('No image has been picked');
  //     }
  //   } else if (kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var f = await image.readAsBytes();
  //       setState(() {
  //         webImage = f;
  //         _pickedImage = File("a");
  //       });
  //     } else {
  //       print('No image has been picked');
  //     }
  //   } else {
  //     print("Somthing went wrong");
  //   }
  // }
}
