import 'dart:js_interop';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repomed/Views/medicine_details_view.dart';
import 'package:repomed/constants.dart';

import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import 'details_table.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.Name,
    this.medicinePrice,
    this.photo,
  }) : super(key: key);
  final String Name;
  final String? medicinePrice;
  final dynamic? photo;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AllMedicineDetailsLoading) {
          isLoading = true;
        } else if (state is AllMedicineDetailsSuccess) {
          Navigator.pushNamed(context, TableWidget.id);
          isLoading = false;
        } else if (state is AllMedicineDetailsFailur) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: Center(
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.1),
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                ),
              ]),
              child: Card(
                elevation: 5,
                color: Colors.grey.shade50,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.capsules,
                            color: kPrimaryColor,
                            size: 80,
                          ),
                          // child: Container(
                          //   child: Image.network(
                          //     photo,
                          //     width: 200,
                          //     height: 140,
                          //   ),
                          // ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          // medicineName.substring(0, 5),
                          Name,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, TableWidget.id);
                              },
                              child: Text(
                                'Details',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                            Text(
                              // '${medicinePrice}'
                              // '\$',
                              '${medicinePrice}'
                              '\$',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // Icon(
                            //   FontAwesomeIcons.capsules,
                            //   color: kPrimaryColor,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
