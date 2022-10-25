import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((ctg) {
          return CategoryItem(ctg.id, ctg.title, ctg.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
    );
  }
}
