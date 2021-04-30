import 'package:flutter/material.dart';
import 'package:mealApp/models/meal.dart';
import 'package:mealApp/screens/categories_screen.dart';
import 'package:mealApp/screens/favorites_screen.dart';
import 'package:mealApp/widgets/MainDrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page": CategoriesScreen(),
        "title": 'Categories',
      },
      {
        "page": FavoriteScreen(widget
            .favoriteMeals), //عرفنا ومن ثم اسندنا قيم كي نامكن من استخدام ويدجت
        "title": 'Your Favorites',
      }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
    return scaffold;
  }
}
