import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';

class CartItem {
  final Meal meal;
  int quantity;

  CartItem({required this.meal, this.quantity = 1});
}

class CartManager {
  CartManager._internal();
  static final CartManager instance = CartManager._internal();

  final List<CartItem> items = [];

  void addToCart(Meal meal, int quantity) {
    final index = items.indexWhere((item) => item.meal.name == meal.name);

    if (index != -1) {
      items[index].quantity += quantity;
    } else {
      items.add(CartItem(meal: meal, quantity: quantity));
    }
  }

  void increment(int index) {
    items[index].quantity++;
  }

  void decrement(int index) {
    if (items[index].quantity > 1) {
      items[index].quantity--;
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  double get subtotal =>
      items.fold(0, (sum, item) => sum + (item.meal.price * item.quantity));
}