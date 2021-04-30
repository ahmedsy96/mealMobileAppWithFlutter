import 'package:flutter/material.dart';
import 'package:mealApp/dummy_data.dart';
import 'package:mealApp/models/meal.dart';
import 'package:mealApp/screens/categories_screen.dart';
import 'package:mealApp/screens/category_meals_screen.dart';
import 'package:mealApp/screens/filters_screen.dart';
import 'package:mealApp/screens/meal_detail_screen.dart';
import 'package:mealApp/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> avaliableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      avaliableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        //==true
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true; //else
      }).toList();
    });
  } //سنمررها للسكرين الخاصة بالفيلتر

  void _toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere(
        (meal) => meal.id == mealId); //اذا لم تجد الانديكس ترجع ال-1
    if (existingIndex != -1) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorites(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App ! ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        canvasColor: Colors.green[100], //اللون الذي سيملئ البودي
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            title: TextStyle(
              fontSize: 21,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            )),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
            avaliableMeals), //الراوت نيم معرف بالكلاس كاتيغوري ميل سكرين
        MealDetailsScren.routeName: (context) =>
            MealDetailsScren(_toggleFavorite, isMealFavorites),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
      /*MyHomePage(title: 'Meal App'),*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CategoriesScreen(),
      floatingActionButton:
          null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
