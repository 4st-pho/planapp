import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _categories = Provider.of<Categories>(context, listen: false).items;
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top,),
        Expanded(
          child: GridView(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            children: _categories.map((e) => CategoryItem(id: e.id ,title: e.title, color: e.color)).toList(),
          ),
        ),
      ],
    );
  }
}
