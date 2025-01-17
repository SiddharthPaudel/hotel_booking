import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';
import 'package:hotel_booking/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:introduction_screen/introduction_screen.dart';



class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();

    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.isCompleted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        }
      },
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Welcome To Quick Stay",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/introduction1.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Find and book the best hotels effortlessly.",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007EF2),
                ),
                bodyTextStyle: TextStyle(fontSize: 18.0),
              ),
            ),
            PageViewModel(
              title: "Plan Your Trip",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/introduction2.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Choose and book the best place for you.",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007EF2),
                ),
                bodyTextStyle: TextStyle(fontSize: 18.0),
              ),
            ),
            PageViewModel(
              title: "Enjoy Your Stay",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/introduction3.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Relax, unwind, and make memories.",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007EF2),
                ),
                bodyTextStyle: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
          showNextButton: true,
          next: Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          showDoneButton: true,
          done: Text(
            "Done",
            style: TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
          onDone: () {
            // Call the Cubit's completeOnboarding method
            onboardingCubit.completeOnboarding();
          },
          dotsDecorator: DotsDecorator(
            size: Size(10.0, 10.0),
            color: Colors.grey,
            activeSize: Size(22.0, 10.0),
            activeColor: Theme.of(context).primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          globalBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
