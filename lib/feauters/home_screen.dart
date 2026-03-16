import 'package:app_meal/core/style/app_colors.dart';
import 'package:app_meal/core/style/app_text_styles.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';
import 'package:app_meal/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:app_meal/core/routing/app_routes.dart';
import 'package:app_meal/feauters/data/db_helper/db_helper.dart';
import 'package:app_meal/feauters/widgets/custom_home_top_page.dart';
import 'package:app_meal/feauters/widgets/custom_food_item.dart';



DatabaseHelper dbHelper = DatabaseHelper.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeTopPage(),
            const HeightSpace(25),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Text(
                        "Your Food",
                        style: AppTextStyles.black16medium,
                      ),
                    ),
                    const HeightSpace(25),
                    Expanded(
                      child: FutureBuilder(
                          future: dbHelper.getMeals(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primarycolor,
                                ),
                              );
                            } else if (snapshot.hasData) {
                              if (snapshot.data!.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Meals Found",
                                    style: AppTextStyles.black16medium,
                                  ),
                                );
                              }
                              return GridView.builder(
                                  itemCount: snapshot.data!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 22.sp,
                                          crossAxisSpacing: 16.sp,
                                          childAspectRatio: 0.9),
                                  itemBuilder: (context, index) {
                                    Meal meal = snapshot.data![index];
                                    return CustomFoodItem(
                                      imageUrl: meal.imageUrl,
                                      name: meal.name,
                                      rate: meal.rate,
                                      time: meal.time,
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            AppRoutes.mealDetailsScreen,
                                            extra: meal);
                                      },
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text("${snapshot.error}"),
                              );
                            }

                            return Container();
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.primarycolor,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.sp,
          ),
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoutes.addMeal);
          },
        ),
      ),
    );
  }
}