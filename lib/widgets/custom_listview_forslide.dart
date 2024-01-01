import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/add_medicine_view.dart';
import 'package:repomed/Views/all_medicine_view.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/widgets/custom_slide.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../generated/l10n.dart';

class SlideListView extends StatelessWidget {
  const SlideListView({
    super.key,
  });

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
              S.of(context).RepoMed,
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
            S.of(context).Home,
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
            S.of(context).add_Medicine,
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
            S.of(context).All_Medicines,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, AllMedicineView.id);
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: Text(
            S.of(context).Log_out,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            BlocProvider.of<AuthCubit>(context).logOut(context);
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            S.of(context).Settings,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
