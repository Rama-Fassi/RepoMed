import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/add_medicine_view.dart';
import 'package:repomed/Views/all_medicine_view.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/widgets/left_slide.dart';

import '../cubits/auth_cubit/auth_cubit.dart';

class CustomListViewforSlide extends StatelessWidget {
  const CustomListViewforSlide({
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
              'RepoMed',
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
            'Home',
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
            'Add Medicine',
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
            'All Medicine',
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
            'Log out',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            BlocProvider.of<AuthCubit>(context).logOut(context);
            print("${AuthCubit.get(context).logoutModel?.messege?.message}kk");
          },
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
