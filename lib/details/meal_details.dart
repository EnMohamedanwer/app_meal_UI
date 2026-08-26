import 'package:app_meal/core/style/app_colors.dart';
import 'package:app_meal/details/cart_manager.dart';
import 'package:app_meal/feauters/data/db_helper/models/meal_models.dart';
import 'package:app_meal/feauters/widgets/cart_item.dart';
import 'package:app_meal/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  final Meal meal;
  const MyCart({super.key, required this.meal});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int quantity = 1;
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF3E7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightSpace(20),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(widget.meal.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const HeightSpace(20),
            Text(
              widget.meal.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const HeightSpace(10),
            Row(
              children: [
                const Icon(Icons.access_time),
                const WidthSpace(5),
                Text(widget.meal.time),
                const WidthSpace(20),
                const Icon(Icons.star, color: Colors.amber),
                const WidthSpace(5),
                Text(widget.meal.rate.toString()),
              ],
            ),
            const HeightSpace(20),
            Text(
              widget.meal.description,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Arial",
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const HeightSpace(20),
            Row(
              children: [
                Text(
                  "Quantity",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Arial",
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const WidthSpace(150),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ), // Display quantity
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const HeightSpace(50),
            Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  CartManager.instance.addToCart(widget.meal, quantity);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "\$${(widget.meal.price * quantity).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primarycolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
