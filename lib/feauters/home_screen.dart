import 'package:app_meal/core/routing/app_routes.dart';
import 'package:app_meal/core/style/app_colors.dart';
import 'package:app_meal/core/style/app_text_styles.dart';
import 'package:app_meal/feauters/data/db_helper/db_helper.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';
import 'package:app_meal/feauters/widgets/custom_food_item.dart';
import 'package:app_meal/feauters/widgets/custom_home_top_page.dart';
import 'package:app_meal/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<int> selectedIds = [];
  bool isSelectionMode = false;

  Future<void> _deleteSelected() async {
    for (int id in selectedIds) {
      await dbHelper.deleteMeal(id);
    }
    setState(() {
      selectedIds.clear();
      isSelectionMode = false;
    });
  }

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Your Food", style: AppTextStyles.black16medium),
                          // ✅ زر الحذف يظهر فقط عند التحديد
                          if (isSelectionMode)
                            TextButton.icon(
                              onPressed: _deleteSelected,
                              icon: const Icon(Icons.delete, color: Colors.red),
                              label: Text(
                                "Delete (${selectedIds.length})",
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
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
                                    childAspectRatio: 0.9,
                                  ),
                              itemBuilder: (context, index) {
                                Meal meal = snapshot.data![index];
                                bool isSelected = selectedIds.contains(meal.id);

                                return GestureDetector(
                                  // ✅ ضغطة عادية
                                  onTap: () {
                                    if (isSelectionMode) {
                                      // في وضع التحديد: حدد أو ألغِ التحديد
                                      setState(() {
                                        if (isSelected) {
                                          selectedIds.remove(meal.id);
                                          if (selectedIds.isEmpty) {
                                            isSelectionMode = false;
                                          }
                                        } else {
                                          selectedIds.add(meal.id!);
                                        }
                                      });
                                    } else {
                                      GoRouter.of(context).pushNamed(
                                        AppRoutes.mealDetailsScreen,
                                        extra: meal,
                                      );
                                    }
                                  },
                                  // ✅ ضغطة مطولة تفعّل وضع التحديد
                                  onLongPress: () {
                                    setState(() {
                                      isSelectionMode = true;
                                      selectedIds.add(meal.id!);
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      CustomFoodItem(
                                        imageUrl: meal.imageUrl,
                                        name: meal.name,
                                        rate: meal.rate,
                                        time: meal.time,
                                        onTap: () {},
                                      ),
                                      // ✅ علامة التحديد
                                      if (isSelectionMode)
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected
                                                  ? AppColors.primarycolor
                                                  : Colors.white,
                                              border: Border.all(
                                                color: AppColors.primarycolor,
                                                width: 2,
                                              ),
                                            ),
                                            child: isSelected
                                                ? const Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 18,
                                                  )
                                                : const SizedBox(
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(child: Text("${snapshot.error}"));
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: isSelectionMode
            ? null // إخفاء زر الإضافة عند التحديد
            : FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: AppColors.primarycolor,
                child: Icon(Icons.add, color: Colors.white, size: 30.sp),
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppRoutes.addMeal);
                },
              ),
      ),
    );
  }
}
