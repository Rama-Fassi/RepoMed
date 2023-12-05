import 'package:flutter/material.dart';

import '../Views/add_medicine_view.dart';
import '../constants.dart';

class CustomCardForGetStart extends StatelessWidget {
  const CustomCardForGetStart({
    super.key,
    required this.text,
    required this.icon,
    required this.ontap,
  });
  final String text;
  final IconData icon;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 220,
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                icon,
                color: kPrimaryColor,
                size: 80,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 30, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
