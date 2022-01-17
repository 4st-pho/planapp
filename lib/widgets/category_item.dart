import 'package:flutter/material.dart';

import '../screens/meal_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem({required this.id, required this.title, required this.color, Key? key})
      : super(key: key);
  void _selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MealScreen.routeName,
      arguments: {'id' : id, 'title' : title}
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.headline5,),
        ),
      ),
    );
  }
}
