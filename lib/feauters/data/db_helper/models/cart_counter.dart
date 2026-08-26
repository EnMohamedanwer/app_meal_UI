// cart_counter.dart
import 'package:flutter/material.dart';

class CartCounter {
  CartCounter._();
  static final ValueNotifier<int> count = ValueNotifier<int>(0);

  static void add() => count.value++;
  static void reset() => count.value = 0;
}