import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_booking/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:hotel_booking/features/onboarding/presentation/view_model/onboarding_cubit.dart';
// Import the OnboardingScreen


class SplashCubit extends Cubit<void> {
  SplashCubit(this._onboardingCubit) : super(null);

  final OnboardingCubit _onboardingCubit;

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      // Open Onboarding Screen

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _onboardingCubit,
              child: OnboardingScreen(), // Navigate to OnboardingScreen
            ),
          ),
        );
      }
    });
  }
}
