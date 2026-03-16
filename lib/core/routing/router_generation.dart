import 'package:app_meal/core/routing/app_routes.dart';
import 'package:app_meal/details/meal_details.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';
import 'package:app_meal/feauters/home_screen.dart';
import 'package:app_meal/feauters/widgets/add_meal_screen.dart';
import 'package:app_meal/feauters/widgets/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.onBoardingScreen, routes: [
    GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen()),
    GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: AppRoutes.addMeal,
        name: AppRoutes.addMeal,
        builder: (context, state) => const AddMealScreen()),
    GoRoute(
        path: AppRoutes.mealDetailsScreen,
        name: AppRoutes.mealDetailsScreen,
        builder: (context, state) {
          Meal meal = state.extra as Meal;
          return MealDetailsScreen(
            meal: meal,
          );
        }),
  ]);
}