import 'package:flutter/material.dart';
import 'package:hotel_booking/view/home_view.dart';
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
      routes: {
        '/Onboard':(context)=>  OnboardingScreen(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/home': (context) =>  HomeView(),
        
        // Add any other routes you need
      },
    );
  }
}
