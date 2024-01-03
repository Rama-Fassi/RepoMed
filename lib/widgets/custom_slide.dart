import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/widgets/check_language.dart';

import '../Views/add_medicine_view.dart';
import '../Views/login_view.dart';
import '../constants.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/show_snack_bar.dart';
import 'custom_listview_forslide.dart';

class CustomSlide extends StatelessWidget {
  bool? isLoading = false;

  CustomSlide({
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Language.isEnglish(context)
                      ? Radius.circular(30)
                      : Radius.circular(0),
                  topLeft: Language.isArabic(context)
                      ? Radius.circular(30)
                      : Radius.circular(0),
                  bottomRight: Language.isEnglish(context)
                      ? Radius.circular(30)
                      : Radius.circular(0),
                  bottomLeft: Language.isArabic(context)
                      ? Radius.circular(30)
                      : Radius.circular(0),
                ),
                color: kPrimaryColor,
              ),
              child: SlideListView(),
            ));
  }
}
