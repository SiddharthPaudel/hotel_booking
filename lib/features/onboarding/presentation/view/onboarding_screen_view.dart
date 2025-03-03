import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/onBoarding/presentation/view_model/onboarding_cubit.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      buildOnboardingPage(
                        subtitle: "Explore a wide variety of books to buy and sell at your convenience",
                        imagePath: "assets/images/introduction1.png",
                        constraints: constraints,
                      ),
                      buildOnboardingPage(
                        subtitle: "Buy and sell books with confidence through a secure platform",
                        imagePath: "assets/images/introduction2.png",
                        constraints: constraints,
                      ),
                      buildOnboardingPage(
                        subtitle: "Engage with a community of readers and book lovers",
                        imagePath: "assets/images/introduction3.png",
                        constraints: constraints,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const SlideEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.black45,
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<OnboardingCubit>().navigateToLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Continue"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  /// ✅ Function to build each onboarding page dynamically
  Widget buildOnboardingPage({
    required String subtitle,
    required String imagePath,
    required BoxConstraints constraints,
  }) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.45,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
