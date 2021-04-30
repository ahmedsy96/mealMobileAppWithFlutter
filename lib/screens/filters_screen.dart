import 'package:flutter/material.dart';
import 'package:mealApp/widgets/MainDrawer.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  final Function saveFiletrs;
  Map<String, bool> currentFilters;

  FiltersScreen(this.saveFiletrs, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFelters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFiletrs(selectedFelters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your Meal Selection. ",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile("Gluten-free",
                    "Obly Include Gluten-Free Meals ", _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    "Lacoste-free",
                    "Obly Include Lacoste-Free Meals ",
                    _lactoseFree, (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    "Vegan", "Obly Include Vegan Meals ", _vegan, (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    "Vegetarian", "Obly Include Vegetarian Meals ", _vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                })
              ],
            ),
          ), //ياخذ كل المساحة المتبقية من الكولومن
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
