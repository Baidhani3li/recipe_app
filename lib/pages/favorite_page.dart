import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritePage(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(child: Text('No Favorites yet'),);
    }
      return ListView.builder(itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index){
          return MealItem(favoriteMeals[index]);
        },
      );
  }
}
