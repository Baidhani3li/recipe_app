import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
//  final Function removeMeal;
  MealItem(this.meal);
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailPage.routeName, arguments: meal.id)
        .then((value){
//          if(value != null)
//            removeMeal(value);
    });
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/img2.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Colors.black45,
                      alignment: Alignment.center,
                      width: 350,
                      child: Text(
                        meal.title,
                        textAlign: TextAlign.center,
//                        softWrap: true,
//                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affText)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
