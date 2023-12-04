import 'package:flutter/material.dart';
import 'package:repomed/widgets/custom_Text_Field.dart';
import '../constants.dart';
import '../widgets/custome_card.dart';
import '../widgets/grid_view_Card.dart';
import '../widgets/left_slide.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({Key? key}) : super(key: key);
  static String id = 'MedicinePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: LeftSlideContainer()),
          Expanded(flex: 5, child: GridViewCard()),
        ],
      ),
    );
  }
}
