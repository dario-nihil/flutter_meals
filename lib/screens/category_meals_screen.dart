import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> avaliableMeals;

  CategoryMealsScreen(this.avaliableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayedMeals = widget.avaliableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String meailId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == meailId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            affordability: displayedMeals[idx].affordability,
            complexity: displayedMeals[idx].complexity,
            duration: displayedMeals[idx].duration,
            id: displayedMeals[idx].id,
            imageUrl: displayedMeals[idx].imageUrl,
            title: displayedMeals[idx].title,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
