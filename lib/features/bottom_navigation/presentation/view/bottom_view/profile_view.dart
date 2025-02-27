import 'package:flutter/material.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width to make layout responsive
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth < 600 ? screenWidth : 600,  // Limit max width for larger screens
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture Section
                CircleAvatar(
                  radius: screenWidth < 600 ? 70 : 100,  // Adjust size for tablet screen
                  backgroundImage: AssetImage('assets/images/pro.png'), // Replace with your image path
                ),
                SizedBox(height: 20),
                
                // User Info in a Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'johndoe@example.com',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: () {
                    // Handle Edit Profile
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Colors.blueAccent.withOpacity(0.5),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),

                // Logout Button
                OutlinedButton(
                  onPressed: () {
                    // Navigate to Login Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    side: BorderSide(color: Colors.redAccent, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
