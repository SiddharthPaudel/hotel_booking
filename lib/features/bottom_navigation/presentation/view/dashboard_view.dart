import 'package:flutter/material.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view/bottom_view/booking_view.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view/bottom_view/home_screen_view.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view/bottom_view/profile_view.dart';



class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenView(),
    const BookingView(),
    const ProfileView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.red, // Set the selected item color to red
          unselectedItemColor:
              Colors.grey, // Optional: Set unselected item color
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
