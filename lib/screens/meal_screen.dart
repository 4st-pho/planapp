import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meals.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealScreen extends StatefulWidget {
  static const routeName = '/meal-screen';
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late String _id;
  late String _title;
  late List<Meal> _meals;

  @override
  void didChangeDependencies() {
    final _data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    _id = _data['id'] as String;
    _title = _data['title'] as String;
    final mealsData = Provider.of<Meals>(context);
    _meals = mealsData.containsId(_id);
    super.didChangeDependencies();
  }

  void _deleteTemp(String id) {
    setState(() {
      _meals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _meals.length,
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: _meals[index].id,
                    imageURL: _meals[index].imageUrl,
                    title: _meals[index].title,
                    duration: _meals[index].duration,
                    affordability: _meals[index].affordability,
                    complexity: _meals[index].complexity,
                    deleteTemp: _deleteTemp,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
