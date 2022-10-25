import 'package:flutter/material.dart';

import '../models/meal.dart';
import './main_drawer.dart';
import './categories_page.dart';
import './favorite_page.dart';


class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsPage(this.favoriteMeals);
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages = [];
  int _selectedTab = 0;
  void selectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesPage(), 'title': 'Meals'},
      {'page': FavoritePage(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedTab]['title']}'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedTab]['page'] as Widget?,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectTab,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTab,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Faviorates',
          ),
        ],
      ),
    );
  }
}
