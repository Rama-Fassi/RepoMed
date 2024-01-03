import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/add_medicine_view.dart';
import 'package:repomed/Views/all_carts_view.dart';
import 'package:repomed/Views/all_medicine_view.dart';
import 'package:repomed/Views/home_view.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/widgets/check_language.dart';
import 'package:repomed/widgets/custom_slide.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../generated/l10n.dart';

class SlideListView extends StatefulWidget {
  const SlideListView({
    super.key,
  });

  @override
  State<SlideListView> createState() => _SlideListViewState();
}

class _SlideListViewState extends State<SlideListView> {
  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to log out?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              "RepoMed".tr(context),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 80),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, GetStarted.id);
          },
          leading: Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text(
            "Home".tr(context),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          title: Text(
            "add_Medicine".tr(context),
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, AddMedicineView.id);
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.medical_information,
            color: Colors.white,
          ),
          title: Text(
            "All_Medicines".tr(context),
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, AllMedicineView.id);
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.add_shopping_cart_outlined,
            color: Colors.white,
          ),
          title: Text(
            "All_Carts".tr(context),
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, AllCartsView.id);
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Language.isEnglish(context)
                ? Icons.arrow_circle_left_rounded
                : Icons.arrow_circle_right_rounded,
            color: Colors.white,
          ),
          title: Text(
            "Start".tr(context),
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, HomeView.id);
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: Text(
            "Log_out".tr(context),
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            _showBackDialog();
          },
        ),
      ],
    );
  }
}
