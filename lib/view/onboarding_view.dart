import 'package:flutter/material.dart';
import 'package:hotel_booking/view/login_view.dart';
import 'package:hotel_booking/view/register_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              pages: [
                PageViewModel(
                  title: "Welcome To Quick Stay",
                  bodyWidget: Column(
                    children: [
                      SizedBox(height: 20), // Add spacing if needed
                      Image.asset(
                        'assets/introduction1.png',
                        height: 250, // Custom height
                        width: 250, // Custom width
                        fit: BoxFit.cover, // Adjust image scaling
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
                    ),
                    bodyTextStyle: TextStyle(fontSize: 18.0),
                  ),
                ),
                PageViewModel(
                  title: "Plan Your Trip",
                  bodyWidget: Column(
                    children: [
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/introduction2.png',
                        height: 250, // Adjusted height
                        width: 250, // Adjusted width
                        fit: BoxFit.cover,
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
                    ),
                    bodyTextStyle: TextStyle(fontSize: 18.0),
                  ),
                ),
                PageViewModel(
                  title: "Enjoy Your Stay",
                  bodyWidget: Column(
                    children: [
                      SizedBox(height: 20),
                      // Image.asset(
                      //   'assets/introduction3.png',
                      //   height: 250, // Smaller size
                      //   width: 250,
                      //   fit: BoxFit.cover,
                      // ),
                      SizedBox(height: 20),
                      Text(
                        "Relax, unwind, and make memories",
                        style: TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    bodyTextStyle: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
              showSkipButton: false,
              showNextButton: false,
              showDoneButton: false,
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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
