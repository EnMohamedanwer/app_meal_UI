import 'package:app_meal/core/style/app_assets.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';

class MealDetails {
  static final List<Meal> meals = [
    Meal(
      name: 'Pizza',
      image: AppAssets.pizzaimage,
      description: 'Delicious pepperoni pizza with melted cheese',
      time: '25 mins',
      rate: 4.5,
      price: 12.99,
    ),
    Meal(
      name: 'Zinger Burger',
      image: AppAssets.zingerburger,
      description: 'Juicy beef burger with fresh lettuce and tomato',
      time: '15 mins',
      rate: 4.2,
      price: 8.99,
    ),
    Meal(
      name: 'Makarna',
      image: AppAssets.makarna,
      description: 'Creamy Alfredo pasta with grilled chicken',
      time: '20 mins',
      rate: 4.8,
      price: 10.00,
    ),
    Meal(
      name: 'Fried Chicken',
      image: AppAssets.friedchicken,
      description: 'Tender roasted chicken with herbs and spices',
      time: '30 mins',
      rate: 4.6,
      price: 14.00,
    ),
    Meal(
      name: 'Crispy Fries',
      image: AppAssets.crispyFries8,
      description: 'Crispy fries with a side of creamy tomato sauce',
      time: '10 mins',
      rate: 4.5,
      price: 5.00,
    ),
    Meal(
      name: 'Hotdog',
      image: AppAssets.hotdog,
      description: 'Juicy beef hotdog with fresh vegetables',
      time: '15 mins',
      rate: 4.3,
      price: 6.50,
    ),
  ];
}
