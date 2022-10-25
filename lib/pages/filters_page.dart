import 'package:flutter/material.dart';

import './main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget buildSwitchListTile(
      String title, String desc, bool curValue, Function updateVal) {
    return SwitchListTile(
      value: curValue,
      title: Text(title),
      subtitle: Text(desc),
      onChanged: updateVal as void Function(bool)?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(icon: (Icon(Icons.save)), onPressed: null),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'Adjust ur meal selection..',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten Free', 'only include gluten-free meals', _glutenFree,
                    (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                buildSwitchListTile(
                    'Lactose Free', 'only include lactose-free meals', _lactoseFree,
                        (newVal) {
                      setState(() {
                        _lactoseFree = newVal;
                      });
                    }),
                buildSwitchListTile(
                    'Vegetarian', 'only include vegetarian meals', _vegetarian,
                        (newVal) {
                      setState(() {
                        _vegetarian = newVal;
                      });
                    }),
                buildSwitchListTile(
                    'Vegan', 'only include Vegan meals', _vegan,
                        (newVal) {
                      setState(() {
                        _vegan = newVal;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
