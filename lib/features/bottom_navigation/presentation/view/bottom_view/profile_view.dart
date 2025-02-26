import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width to make layout responsive
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(  // Center the content in the body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth < 600 ? screenWidth : 600,  // Limit max width for larger screens (like tablets)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
              crossAxisAlignment: CrossAxisAlignment.center,  // Center horizontally
              children: [
                CircleAvatar(
                  radius: screenWidth < 600 ? 50 : 80,  // Adjust size for tablet screen
                  backgroundImage: AssetImage('assets/images/pro.png'), // Replace with your image path
                ),
                SizedBox(height: 20),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'johndoe@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Handle Edit Profile
                  },
                  child: Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    // Handle Logout
                  },
                  child: Text('Logout', style: TextStyle(color: Colors.redAccent)),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    side: BorderSide(color: Colors.redAccent),
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
