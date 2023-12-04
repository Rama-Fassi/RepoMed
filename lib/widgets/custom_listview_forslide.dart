import 'package:flutter/material.dart';

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
          height: 30,
        ),
        Center(
          child: Text(
            'RepoMed',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 100),
        ListTile(
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
            Icons.medical_information,
            color: Colors.white,
          ),
          title: Text(
            'All Medicine',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {},
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          title: Text(
            'Medicine Categories',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {},
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: Text(
            'User Profile',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {},
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
