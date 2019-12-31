import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = 'category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final String categoryTitle = routeArgs['title'];
    final Color categoryColor = routeArgs['color'];
    final String categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

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
          );
        },
      ),
    );
  }
}
