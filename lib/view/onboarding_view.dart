import 'package:flutter/material.dart';
import 'package:hotel_booking/view/login_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome To Quick Stay",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Vertically center the content
              crossAxisAlignment: CrossAxisAlignment.center,  // Horizontally center the content
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
                color: Color(0xFF007EF2),  // Changed the title color here
              ),
              bodyTextStyle: TextStyle(fontSize: 18.0),
            ),
          ),
          PageViewModel(
            title: "Plan Your Trip",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Vertically center the content
              crossAxisAlignment: CrossAxisAlignment.center,  // Horizontally center the content
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
                color: Color(0xFF007EF2),  // Changed the title color here
              ),
              bodyTextStyle: TextStyle(fontSize: 18.0),
            ),
          ),
          PageViewModel(
            title: "Enjoy Your Stay",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Vertically center the content
              crossAxisAlignment: CrossAxisAlignment.center,  // Horizontally center the content
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
                color: Color(0xFF007EF2),  // Changed the title color here
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
          // Navigate to the next screen after the onboarding
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
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
    );
  }
}
