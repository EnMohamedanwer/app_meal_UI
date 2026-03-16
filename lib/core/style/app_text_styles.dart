import 'package:app_meal/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle onboardingtitle = GoogleFonts.inter(fontSize: 32.sp, fontWeight: FontWeight.w700,
  color: AppColors.white);
  static TextStyle onboardingdescriptionstyle = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.normal,
  color: AppColors.white);

  static TextStyle white14semiBold = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500,
  color: AppColors.white);

  static TextStyle black16medium= GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500,
  color: AppColors.black);

  static TextStyle grey14medium= GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500,
  color: Color(0xFF878787));
}
