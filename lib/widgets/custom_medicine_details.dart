import 'package:flutter/material.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';

class CustomDetail extends StatelessWidget {
  const CustomDetail({
    super.key,
    // required this.cubit,
    this.index,
    required this.text,
    this.width,
    this.height,
  });

  // final AllApiCubit cubit;
  final int? index;
  final String? text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1),
          ),
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
