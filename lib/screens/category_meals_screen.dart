import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String id = routeArgs['id'];
    final String title = routeArgs['title'];
    final Color color = routeArgs['color'];
    final List<Meal> categoryMeals = DUMMY_MEALS.where((Meal meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final Meal item = categoryMeals[index];
          return MealItem(
            id: item.id,
            title: item.title,
            imageUrl: item.imageUrl,
            duration: item.duration,
            complexity: item.complexity,
            affordability: item.affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
