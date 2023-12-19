import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Views/add_medicine_view.dart';
import '../Views/login_view.dart';
import '../constants.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/show_snack_bar.dart';
import 'custom_listview_forslide.dart';

class LeftSlideContainer extends StatelessWidget {
  bool? isLoading = false;

  LeftSlideContainer({
    super.key,
    this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LogoutLoading) {
            isLoading = true;
          } else if (state is LogoutSuccess) {
            Navigator.pushNamed(context, LoginView.id);
            isLoading = false;
          } else if (state is LogoutFailure) {
            showSnakbar(context, state.errMessage);
            isLoading = false;
          }
        },
        builder: (context, state) =>
            // BlurryModalProgressHUD(
            // inAsyncCall: isLoading,
            // child:
            Container(
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
            ));
  }
}
