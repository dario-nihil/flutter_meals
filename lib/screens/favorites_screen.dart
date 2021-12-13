import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            affordability: favoriteMeals[idx].affordability,
            complexity: favoriteMeals[idx].complexity,
            duration: favoriteMeals[idx].duration,
            id: favoriteMeals[idx].id,
            imageUrl: favoriteMeals[idx].imageUrl,
            title: favoriteMeals[idx].title,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
