import 'package:delimeals/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = 'meal-detail';

  Widget buildConentContainer({Widget child}) {
    return Container(
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mealId = ModalRoute.of(context).settings.arguments as String;
    var selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              SectionTitle('Ingredients'),
              buildConentContainer(
                  child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              )),
              SectionTitle("Steps"),
              buildConentContainer(
                  child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text("${selectedMeal.steps[index]}"),
                      ),
                      Divider(),
                    ],
                  );
                },
              ))
            ],
          ),
        ));
  }
}
