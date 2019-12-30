import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName='category-meals';
  final String id;
  final String title;
  final Color color;

  CategoryMealsScreen({this.id,this.title, this.color});

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
    final String categoryTitle=routeArgs['title'];
    final Color categoryColor=routeArgs['color'];
    final String categoryId=routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: Text("The Recipe For The Category"),
      ),
    );
  }
}
