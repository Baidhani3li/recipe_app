import 'package:flutter/material.dart';

import './pages/tabs_page.dart';
import './pages/filters_page.dart';
import './pages/meal_detail_page.dart';

import './models/meal.dart';
import 'dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favoriteMeals = [];
  
  void _toggleFavorite(String id){
    final mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == id);
    if(mealIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 240, 220, 1),
        fontFamily: 'Realway',
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(50, 20, 30, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(50, 20, 30, 1)),
          headline6: const TextStyle(fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.bold)
        ),

      ),
//      home: CategoriesPage(),
      routes: {
        '/': (c) => TabsPage(_favoriteMeals),
//        '/category-meal': (c) => CategoryMealPage(),
        MealDetailPage.routeName: (c) => MealDetailPage(_toggleFavorite, _isFavorite),
        FiltersPage.routeName: (c) => FiltersPage()
      },
    );
  }
}




