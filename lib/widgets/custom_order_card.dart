import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/constants.dart';
import '../Views/medicine_details_view.dart';
import '../generated/l10n.dart';

class CustomOrderCard extends StatelessWidget {
  const CustomOrderCard({
    Key? key,
    required this.medicineName,
    this.quantity,
    this.photo,
    this.id,
    this.cart_id,
  }) : super(key: key);
  final String medicineName;
  final String? quantity;
  final String? cart_id;
  final dynamic? photo;
  final dynamic? id;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    '${"Medicine".tr(context)}:${medicineName}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    // medicineName.substring(0, 5),
                    '${"Quantity".tr(context)}:${quantity}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // medicineName.substring(0, 5),
                        '${"Cart_id".tr(context)}:${cart_id}',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        // medicineName.substring(0, 5),
                        '${"Order_id".tr(context)}:${id}',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
