import 'package:flutter/material.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/booking_view.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/home_screen_view.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/profile_view.dart';


class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<BottomNavigationView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenView(),
    const BookingView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Prevent resizing and overflow
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5.0), // Add padding for bottom space
        child: _screens[_selectedIndex], // Display selected screen
      ),
      bottomNavigationBar: SafeArea( // Wrap BottomNavigationBar inside SafeArea
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/home.png', 'Home'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/online-booking.png', 'My Booking'),
              label: 'My Booking',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/user.png', 'Profile'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, String label) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {});
      },
      onExit: (_) {
        setState(() {});
      },
      child: IconButton(
        icon: Image.asset(
          assetPath,
          width: 23, // Adjust icon size
          height: 23,
          color: _selectedIndex == _getIconIndex(label) ? Colors.blue : Colors.black,
        ),
        onPressed: () {
          // Handle navigation or other actions
          _onItemTapped(_getIconIndex(label));
        },
      ),
    );
  }

  int _getIconIndex(String label) {
    switch (label) {
      case 'Home':
        return 0;
      case 'My Booking':
        return 1;
      case 'Profile':
        return 2;
      default:
        return 0;
    }
  }
}
