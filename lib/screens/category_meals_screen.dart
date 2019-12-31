import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = 'category-meals';
  final List<Meal> avaliableMeals;
  CategoryMealsScreen(this.avaliableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  Color categoryColor;
  String categoryId;
  List<Meal> categoryMeals;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      categoryTitle = routeArgs['title'];
      categoryColor = routeArgs['color'];
      categoryId = routeArgs['id'];
      categoryMeals = widget.avaliableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          var meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            removeMeal: _removeMeal,
          );
        },
      ),
    );
  }
}
