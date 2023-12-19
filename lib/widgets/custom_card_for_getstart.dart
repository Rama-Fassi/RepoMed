import 'package:flutter/material.dart';
import '../constants.dart';

class CustomCardForStartPage extends StatelessWidget {
  const CustomCardForStartPage({
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
          borderRadius: BorderRadius.circular(15),
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
