import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:repomed/constants.dart';

class Medicine2 {
  final String name;
  final String tradeName;
  final String category;
  final String imageUrl;

  Medicine2({
    required this.name,
    required this.tradeName,
    required this.category,
    required this.imageUrl,
  });
}

class MedicineDetailPage extends StatelessWidget {
  final Medicine2 medicine;

  MedicineDetailPage({required this.medicine});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  border: Border.all(
                    width: 2,
                    color: kPrimaryColor,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display Medicine Image on the Left
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/img_1.png"),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),

                  // Display Medicine Details on the Right
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display Medicine Name
                        Text(
                          'Medicine Name: ${medicine.name}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),

                        // Display Trade Name
                        Text(
                          'Trade Name: ${medicine.tradeName}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),

                        // Display Category
                        Text(
                          'Category: ${medicine.category}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
