import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view/bottom_view/home_screen_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        HomeScreenView(), // Added Dashboard view
        const Center(child: Text('Booking')), // Placeholder for Courses
        const Center(child: Text('Profile')), // Placeholder for Batches
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
