import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealPage extends StatefulWidget {
  final String id;
  final String title;
  const CategoryMealPage(this.id, this.title);

  @override
  _CategoryMealPageState createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  List<Meal> ctgMeals = [];
  void removeMeal(String id){
    setState(() {
    ctgMeals.removeWhere((meal) => id == meal.id);
    });
  }

  @override
  void initState() {
    ctgMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(widget.id);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: ListView.builder(itemCount: ctgMeals.length,
        itemBuilder: (ctx, index){
        return MealItem(ctgMeals[index]);
        },
      ),
    );
  }
}
