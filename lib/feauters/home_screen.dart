import 'package:app_meal/core/style/app_colors.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';
import 'package:app_meal/feauters/widgets/custom_food_item.dart';
import 'package:app_meal/feauters/widgets/custom_home_top_page.dart';
import 'package:app_meal/widgets/meals_grid.dart';
import 'package:app_meal/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Meal> meals = MealDetails.meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(208, 255, 248, 224),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            const CustomHomeTopPage(),
            const HeightSpace(20),
            Text('popular Meals ',style: TextStyle(
              fontWeight:FontWeight.w700,color: Colors.black,fontSize: 20.sp
            ),),
            const HeightSpace(20),
            PopularMealsGrid(meals: meals),
            const HeightSpace(20),

          ],
        )
      ),
    );
  }
}
