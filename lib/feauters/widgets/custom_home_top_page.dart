import 'package:app_meal/core/style/app_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeTopPage extends StatelessWidget {
  const CustomHomeTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        CarouselSlider(
          items: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/images/pizza.png', fit: BoxFit.cover),
            ),
            Image.asset(AppAssets.exampleFoodimage),
            Image.asset(AppAssets.addmealimage),
          ],
          options: CarouselOptions(
            height: 350.h,
            viewportFraction: 1.4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true

          ),
        ),
      ],
    );
  }
}
