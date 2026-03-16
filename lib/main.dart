import 'package:app_meal/core/routing/router_generation.dart';
import 'package:app_meal/feauters/widgets/onboarding_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OnBoardingServices.initializeSharedPrefrencesStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Meals App',
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}