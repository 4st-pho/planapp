import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageURL;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function(String id) deleteTemp;
  const MealItem(
      {required this.id,
      required this.imageURL,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.deleteTemp,
      key})
      : super(key: key);
  String get _complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Very simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'So hard';
      default:
        return 'Unknow';
    }
  }

  String get _affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Very pricey';
      default:
        return 'Unknow';
    }
  }

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id).then((value){
      if(value != null){
        deleteTemp(value as String);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        color: Colors.green.shade200,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(208, 135, 112, 0.4)),
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headline5,
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.timelapse),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              '$duration minutes',
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.work),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              _complexityText,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.money_off),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              _affordabilityText,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
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
