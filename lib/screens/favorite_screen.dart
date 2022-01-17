import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meals.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
  final _mealsFavorite = Provider.of<Meals>(context).itemsFavotite;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
        ),
        body: _mealsFavorite.isEmpty
            ? const Center(
                child: Text('No have any favorite meal'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _mealsFavorite.length,
                      itemBuilder: (ctx, index) {
                        return MealItem(
                          id: _mealsFavorite[index].id,
                          imageURL: _mealsFavorite[index].imageUrl,
                          title: _mealsFavorite[index].title,
                          duration: _mealsFavorite[index].duration,
                          affordability: _mealsFavorite[index].affordability,
                          complexity: _mealsFavorite[index].complexity,
                          deleteTemp: (_) {},
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
