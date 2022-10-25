import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFav;
  MealDetailPage(this.toggleFavorite, this.isFav);

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: double.infinity,
              height: 300,
              child: Image.asset(
                'assets/images/img2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(6.5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index], style: TextStyle(fontSize: 17),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
