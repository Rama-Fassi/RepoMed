import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/cubits/language_cubit/language_cubit.dart';
import 'package:repomed/main.dart';
import 'package:repomed/widgets/check_language.dart';
import 'package:repomed/widgets/custom_button.dart';
import '../constants.dart';
import '../cubits/language_cubit/locale_cubit.dart';
import '../generated/l10n.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // If the screen width is greater than 600 pixels, display a two-column layout
          return Scaffold(
            appBar: AppBar(
              leading: BlocConsumer<LocaleCubit, ChangeLocaleState>(
                listener: (context, state) {
                  // Navigator.of(context).pop();
                },
                builder: (context, state) {
                  return Padding(
                    padding: Language.isEnglish(context)
                        ? EdgeInsets.only(left: 10)
                        : EdgeInsets.only(right: 10),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: state.locale.languageCode,
                      // style: TextStyle(color: Colors.blueAccent),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      iconSize: 25,
                      elevation: 16,
                      underline: Container(
                        height: 0,
                        color: Colors.transparent,
                      ),
                      items: ['ar', 'en'].map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          context.read<LocaleCubit>().changeLanguage(newValue);
                        }
                      },
                    ),
                  );
                },
              ),
              backgroundColor: kPrimaryColor,
              elevation: 0.0,
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kSizedBox,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Repomed_logo.png',
                        width: 150,
                        height: 150,
                      ),
                      kSizedBox,
                      Text(
                        "Manage_Your".tr(context),
                        style: TextStyle(
                            fontSize: Language.isEnglish(context) ? 70 : 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900),
                      ),
                      Text(
                        "RepoMed".tr(context),
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: kLogoColor1),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: "Get_Started".tr(context),
                        width: 300,
                        height: 60,
                        borderRadius: 80,
                        padding: 10,
                        onTap: () {
                          Navigator.pushNamed(context, GetStarted.id);
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 1000,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img_3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          // If the screen width is 600 pixels or less, display a single-column layout
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0.0,
            ),
            body: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Manage Your',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900),
                      ),
                      Text(
                        'RepoMed',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: kLogoColor1),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Get Started',
                        width: 300,
                        height: 60,
                        borderRadius: 80,
                        padding: 10,
                        onTap: () {
                          Navigator.pushNamed(context, GetStarted.id);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
