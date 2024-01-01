import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              S.of(context).Enter_The_Medicine_Details,
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
                        labelText: S.of(context).Scientific_Name,
                      ),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            tradeName = value;
                          },
                          labelText: S.of(context).Trade_Name),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            categoriesName = value;
                          },
                          labelText: S.of(context).Medicine_Category),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            companyName = value;
                          },
                          labelText: S.of(context).The_Manufacture_Company),
                      kSizedBox,
                      CustomTextFormField(
                        onChanged: (value) {
                          quantity = value;
                        },
                        labelText: S.of(context).Quantity,
                        inputType: TextInputType.number,
                      ),
                      kSizedBox,
                      CustomTextFormField(
                          inputType: TextInputType.datetime,
                          onChanged: (value) {
                            expirationAt = value;
                          },
                          labelText: S.of(context).expiration_time),
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
                          labelText: S.of(context).The_Price),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            form = value;
                          },
                          labelText: S.of(context).Form),
                      kSizedBox,
                      CustomTextFormField(
                          onChanged: (value) {
                            details = value;
                          },
                          labelText: S.of(context).Details),
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
                      photo: _webImage!,
                    );
                  } else {}
                },
                text: S.of(context).Add_Medicine,
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
