import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: camel_case_types
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.labelText,
      this.icon,
      this.hint,
      this.onChanged,
      this.inputType,
      this.label,
      this.obsecureText,
      this.onTap});
  final String? labelText;
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool? obsecureText;

  final Function(String)? onChanged;
  final TextInputType? inputType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      keyboardType: inputType,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(
          icon,
          color: kLogoColor1,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        labelText: labelText,
        labelStyle:
            const TextStyle(color: kColor4, fontWeight: FontWeight.bold),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: kLogoColor1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kColor5,
          ),
          // ),
        ),
      ),
    );
  }
}
