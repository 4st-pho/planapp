import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';
  const MealDetailScreen({Key? key}) : super(key: key);
  Widget _buildTitle(String title, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline5,
      ),
    );
  }

  Widget _buildContainer(double width, Widget widget) {
    return Container(
      height: 300,
      width: width * 0.75,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black38),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _meals = Provider.of<Meals>(context);
    final _width = MediaQuery.of(context).size.width;
    final _id = ModalRoute.of(context)!.settings.arguments as String;
    final _meal = _meals.findById(_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
        actions: [
          IconButton(
            onPressed: () => _meals.toggleFavorite(_id),
            icon: _meals.isFavorite(_id)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(_meal.imageUrl),
            ),
            _buildTitle('ingredients', context),
            _buildContainer(
              _width,
              _buildContainer(
                  _width,
                  ListView.builder(
                      itemCount: _meal.ingredients.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _meal.ingredients[index],
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        );
                      })),
            ),
            _buildTitle('Step', context),
            _buildContainer(
              _width,
              ListView.builder(
                itemCount: _meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                        backgroundColor: Colors.redAccent,
                      ),
                      title: Text(_meal.steps[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(_id);
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}
