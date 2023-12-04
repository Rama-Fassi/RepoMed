import 'package:flutter/material.dart';

import '../Views/add_medicine_view.dart';
import '../constants.dart';
import 'custom_listview_forslide.dart';

class LeftSlideContainer extends StatelessWidget {
  const LeftSlideContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: kPrimaryColor,
      ),
      child: CustomListViewforSlide(),
    );
  }
}
