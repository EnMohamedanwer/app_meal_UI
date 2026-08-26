import 'package:app_meal/details/cart_manager.dart';
import 'package:app_meal/details/meal_details.dart';
import 'package:app_meal/feauters/data/db_helper/models/cart_counter.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';
import 'package:app_meal/feauters/widgets/cards_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularMealsGrid extends StatelessWidget {
  final List<Meal> meals;

  const PopularMealsGrid({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.8,
      ),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return CardsItem(
          image: meal.image,
          title: meal.name,
          price: '\$${meal.price.toStringAsFixed(1)}',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCart(meal: meal),
              ),
            );
          },
          onAddTap: () {
            CartManager.instance.addToCart(meal, 1);
            CartCounter.add();
          },
        );
      },
    );
  }
}