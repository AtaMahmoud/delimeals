import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildDrawerItem(IconData iconData, String text,Function tabHandler) {
    return ListTile(
      onTap: tabHandler,
      leading: Icon(iconData, size: 26),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDrawerItem(Icons.restaurant,'Meals',(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerItem(Icons.settings,'Filters',(){
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
