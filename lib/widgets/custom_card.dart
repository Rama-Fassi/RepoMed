import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/widgets/check_language.dart';
import '../Views/medicine_details_view.dart';
import '../generated/l10n.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.Name,
    this.medicinePrice,
    this.photo,
    this.id,
    this.medicineQuantity,
    required this.onTap,
  }) : super(key: key);
  final String Name;
  final String? medicinePrice;
  final String? medicineQuantity;

  final dynamic? photo;
  final dynamic? id;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: Language.isEnglish(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    FontAwesomeIcons.capsules,
                    color: kPrimaryColor,
                    size: 100,
                  ),
                  // child: Container(
                  //   child: Image.network(
                  //     photo,
                  //     width: 200,
                  //     height: 140,
                  //   ),
                  // ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  // medicineName.substring(0, 5),
                  Name,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 60,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Details1".tr(context),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      // '${medicinePrice}'
                      // '\$',
                      '${medicineQuantity}',
                      // '\$',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
