import 'package:flutter/material.dart';
import 'package:hotel_booking/view/onboarding_view.dart';
import 'login_view.dart'; // Import your LoginView page

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the login page when the logo is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              child: Image.asset(
                'assets/new_logo.png', // Path to your image
                width: 360, // Adjust size as needed
                height: 360, // Adjust height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
