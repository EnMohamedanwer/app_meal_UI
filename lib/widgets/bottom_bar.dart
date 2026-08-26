import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:app_meal/feauters/data/db_helper/models/cart_counter.dart';
import 'package:app_meal/feauters/home_screen.dart';
import 'package:app_meal/feauters/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _pageController = PageController();
  final NotchBottomBarController _notchController = NotchBottomBarController(
    index: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _notchController.jumpTo(index);
        },
        children: const [
          HomeScreen(),
          Center(child: Text('offers')),
          CartPage(),
          Center(child: Text('Profile')),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _notchController,
        color: Colors.white,
        notchColor: Colors.brown.shade200,
        showLabel: true,
        kBottomRadius: 28,
        kIconSize: 24,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        bottomBarItems:  [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_filled, color: Colors.blueGrey),
            activeItem: Icon(Icons.home_filled, color: Colors.black),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.local_offer, color: Colors.blueGrey),
            activeItem: Icon(Icons.local_offer, color: Colors.black),
            itemLabel: 'Offers',
          ),
          BottomBarItem(
            inActiveItem: _CartIcon(Icons.shopping_cart, color: Colors.blueGrey),
            activeItem: _CartIcon(Icons.shopping_cart, color: Colors.black),
            itemLabel: 'Cart',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person, color: Colors.blueGrey),
            activeItem: Icon(Icons.person, color: Colors.black),
            itemLabel: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
class _CartIcon extends StatelessWidget {
  final Color color;
  const _CartIcon(IconData shopping_cart, {required this.color});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: CartCounter.count,
      builder: (context, value, child) {
        return Badge(
          label: Text('$value'),
          isLabelVisible: value > 0,
          backgroundColor: Colors.red,
          child: Icon(Icons.shopping_cart, color: color),
        );
      },
    );
  }
}
