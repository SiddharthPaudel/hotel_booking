import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sajilobihe_event_venue_booking_system/features/splash/presentation/view_model/splash_cubit.dart';




class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init(context); // Use SplashCubit for navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Main_logo.png', // Path to your image
              width: 360, // Adjust size as needed
              height: 360, // Adjust height as needed
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), // Show loading indicator during the splash
          ],
        ),
      ),
    );
  }
}
