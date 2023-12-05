import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/widgets/custom_button.dart';
import 'package:repomed/widgets/left_slide.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/add_medicine_view_body.dart';
import '../widgets/custom_Text_Field.dart';
import '../widgets/textFiledPickedDate.dart';

class AddMedicineView extends StatefulWidget {
  const AddMedicineView({Key? key}) : super(key: key);
  static String id = 'Add Medicine';
  @override
  State<AddMedicineView> createState() => _AddMedicineViewState();
}

class _AddMedicineViewState extends State<AddMedicineView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AddMedicineLoading) {
          isLoading = true;
        } else if (state is AddMedicineSuccess) {
          Navigator.pop(context);
          isLoading = false;
        } else if (state is AddMedicineFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Row(
            children: [
              Expanded(flex: 1, child: LeftSlideContainer()),
              Expanded(
                flex: 5,
                child: AddMedicineViewBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
