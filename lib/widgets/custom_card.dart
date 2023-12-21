import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repomed/constants.dart';
import '../Views/medicine_details_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.Name,
    this.medicinePrice,
    this.photo,
    this.id,
  }) : super(key: key);
  final String Name;
  final String? medicinePrice;
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MedicineDetailsView(index: id)),
                          );
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
    );
  }
}
