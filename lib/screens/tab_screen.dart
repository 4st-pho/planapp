import 'package:flutter/material.dart';

import './category_screen.dart';
import './favorite_screen.dart';
import './setting_screen.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      const CategoryScreen(),
      const FavoriteScreen(),
      const SettingScreen()
      // currentFilter: widget.currentFilter, filterMeal: widget.filterMeal),
    ];
    super.initState();
  }

  int _currentPage = 0;
  void _selectPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: _currentPage,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
    );
  }
}
