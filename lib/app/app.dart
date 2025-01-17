import 'package:flutter/material.dart';
import 'package:hotel_booking/Buttom_screen/home_screen_view.dart';
import 'package:hotel_booking/common/core/App_theme/app_theme.dart';
import 'package:hotel_booking/view/dashboard_view.dart';
import 'package:hotel_booking/view/login_view.dart';
import 'package:hotel_booking/view/onboarding_view.dart';
import 'package:hotel_booking/view/register_view.dart';
import 'package:hotel_booking/view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      theme: getApplicationTheme(),
      routes: {
        '/Onboard': (context) => OnboardingScreen(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/Dash': (context) => DashboardView(),
        '/home': (context) => HomeScreenView()

        // Add any other routes you need
      },
    );
  }
}