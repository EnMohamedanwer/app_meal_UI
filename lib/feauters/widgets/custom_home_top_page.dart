import 'package:app_meal/core/style/app_assets.dart';
import 'package:app_meal/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeTopPage extends StatelessWidget {
  const CustomHomeTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homescreenimage,
          width: double.infinity,
          height: 346,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 30,
          left: 20,
          bottom: 20,
          child: Container(
            width: 195.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: AppColors.primarycolor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(48.r),
            ),
            alignment: Alignment.center,

            child: Text(
              textAlign: TextAlign.center,
              " Welcome Add A new meal",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
