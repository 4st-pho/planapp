import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meals.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isGluten = false;
  bool _isLactose = false;
  bool _isVegan = false;
  bool _isVegantarian = false;
  late Meals _meals;
  @override
  void initState() {
    _meals = Provider.of<Meals>(context, listen: false);
    _isGluten = _meals.filter['gluten'] as bool;
    _isLactose = _meals.filter['lactose'] as bool;
    _isVegan = _meals.filter['vegan'] as bool;
    _isVegantarian = _meals.filter['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool valueTemp,
      Function(bool value) handle) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(subtitle),
      value: valueTemp,
      onChanged: handle,
      activeColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter', style: Theme.of(context).textTheme.headline5),
          actions: [
            IconButton(
                onPressed: () => _meals.updateFilter(
                      {
                        'gluten': _isGluten,
                        'lactose': _isLactose,
                        'vegan': _isVegan,
                        'vegetarian': _isVegantarian,
                      },
                    ),
                icon: const Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            _buildSwitchListTile(
                'Is gluten-free', 'Only contain gluten-free meals', _isGluten,
                (value) {
              setState(() {
                _isGluten = value;
              });
            }),
            _buildSwitchListTile('Is lactose-free',
                'Only contain lactose-free meals', _isLactose, (value) {
              setState(() {
                _isLactose = value;
              });
            }),
            _buildSwitchListTile(
                'Is vegan', 'Only contain vegan meals', _isVegan, (value) {
              setState(() {
                _isVegan = value;
              });
            }),
            _buildSwitchListTile('Is vegantarian',
                'Only contain vegantarian meals', _isVegantarian, (value) {
              setState(() {
                _isVegantarian = value;
              });
            }),
          ],
        ));
  }
}
