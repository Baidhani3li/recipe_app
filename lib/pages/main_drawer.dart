import 'package:flutter/material.dart';

import './filters_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler as void Function()?,
    );
  }

  void selectPage() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Aloosh',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
