import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/categories.dart';
import './providers/categories.dart';
import './providers/meals.dart';
import './screens/tab_screen.dart';
import './screens/meal_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Meals(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: const TextStyle(color: Colors.white, fontSize: 16),
                headline5: const TextStyle(
                  color: Colors.white,
                ),
              ),
          bottomAppBarColor: Colors.green.shade200,
          scaffoldBackgroundColor: Colors.purpleAccent,
          primaryColor: Colors.purple,
          primarySwatch: Colors.purple,
        ),
        home: const TabScreen(),
        routes: {
          MealScreen.routeName: (ctx) => const MealScreen(),
          MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        },
      ),
    );
  }
}
