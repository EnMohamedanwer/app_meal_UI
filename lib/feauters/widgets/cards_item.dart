import 'package:app_meal/core/style/app_colors.dart';
import 'package:app_meal/feauters/data/db_helper/models/cart_counter.dart';
import 'package:app_meal/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsItem extends StatelessWidget {
  final String? image;
  final String? title;
  // final String? description;
  final String? price;
  final VoidCallback? onTap;
   final VoidCallback? onAddTap; 
  const CardsItem({
    super.key,
    this.image,
    this.title,
    this.price,
    this.onTap,
    this.onAddTap,
    // this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200.h,
        width: 160.w,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const HeightSpace(10),
            Text(
              title!,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
            const HeightSpace(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primarycolor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    CartCounter.add();
                    onAddTap?.call(); 
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(Icons.add, color: AppColors.white),
                  ),
                ),
              ],
            ),
            const HeightSpace(10),
          ],
        ),
      ),
    );
  }
}
