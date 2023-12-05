import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.labelText,
      this.icon,
      this.hint,
      this.onChanged,
      this.inputType,
      this.label,
      this.obsecureText = false,
      this.onTap});
  final String? labelText;
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool? obsecureText;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: inputType,
      onChanged: onChanged,
      onTap: onTap,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(
          icon,
          color: kLogoColor1,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle:
            const TextStyle(color: kLogoColor1, fontWeight: FontWeight.bold),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
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
