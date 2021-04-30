import 'package:flutter/material.dart';
import 'package:mealApp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              //margin: EdgeInsets.all(5),
              color: Theme.of(context).accentColor,
              child: Text(
                "Cooking Up!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 15,
            ),
            buildListTile("Meal", Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            buildListTile("Filters", Icons.settings, () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
