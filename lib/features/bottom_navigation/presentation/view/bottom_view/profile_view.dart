import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture Section
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://www.example.com/path_to_your_image.jpg', // Example image URL, replace with user image URL or local asset
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Name
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('John Doe'),
              subtitle: Text('Full Name'),
            ),
            const Divider(),

            // Email
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('john.doe@example.com'),
              subtitle: Text('Email Address'),
            ),
            const Divider(),

            // Phone Number (Editable)
            TextFormField(
              initialValue: '123-456-7890', // Example phone number
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const Divider(),

            // Address (Editable)
            TextFormField(
              initialValue: '123 Main St, Springfield, IL', // Example address
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.home),
              ),
            ),
            const Divider(),

            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to navigate to edit profile screen or save changes
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit Profile clicked')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Edit Profile'),
              ),
            ),

            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Log out functionality goes here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logging Out')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
