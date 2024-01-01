import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/widgets/check_language.dart';
import '../constants.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../generated/l10n.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'check_language.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  bool showPass = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: kLinearGradient,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                kLogo,
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).RepoMed,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: CustomTextFormField(
                      hint: S.of(context).Email,
                      label: S.of(context).Email,
                      inputType: TextInputType.emailAddress,
                      icon: Icons.email,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 500,
                    child: CustomTextFormField(
                      hint: S.of(context).password,
                      label: S.of(context).password,
                      onChanged: (value) {
                        password = value;
                      },
                      onTap: () {
                        showPass = !showPass;
                        setState(() {});
                      },
                      obsecureText: showPass,
                      icon: showPass ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    padding: 10,
                    borderRadius: 8,
                    width: Language.isArabic() ? 150 : 100,
                    height: 50,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .login(email: email!, password: password!);
                      } else {}
                    },
                    text: S.of(context).Login,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
