import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view_model/profile/profile_cubit.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view_model/profile/profile_state.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the ProfileCubit using DI (GetIt instance)
    final profileCubit = GetIt.instance<ProfileCubit>();

    return BlocProvider(
      create: (_) => profileCubit, // Inject ProfileCubit here
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              // Display user profile details
              final user = state.userProfile;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${user.username}'),
                  Text('Email: ${user.email}'),
                  // Display other user details...
                ],
              );
            } else if (state is ProfileError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
