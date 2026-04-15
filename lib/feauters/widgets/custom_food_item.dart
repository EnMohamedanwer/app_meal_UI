import 'package:app_meal/core/style/app_colors.dart';
import 'package:app_meal/core/style/app_text_styles.dart';
import 'package:app_meal/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFoodItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function() onTap;

  const CustomFoodItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: SizedBox(

        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl, width: 150.w,fit: BoxFit.cover, height: 100.h),
              HeightSpace(8),
              SizedBox(
                width: 120.w,child: Text(name, style: AppTextStyles.black16medium)),
              HeightSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primarycolor, size: 16.sp),
                       WidthSpace(4),
                      Text(
                        rate.toString(),
                        style: AppTextStyles.grey14medium.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                   WidthSpace(10),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: AppColors.primarycolor,
                        size: 16.sp,
                      ),
                      const WidthSpace(4),
                      Text(
                        time.toString(),
                        style: AppTextStyles.grey14medium.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
