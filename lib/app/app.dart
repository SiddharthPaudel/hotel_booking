import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/di/di.dart';
import 'package:hotel_booking/core/theme/app_theme.dart';

import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view_model/home_cubit.dart';
import 'package:hotel_booking/features/splash/presentation/view/splash_view.dart';
import 'package:hotel_booking/features/splash/presentation/view_model/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => getIt<SplashCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => getIt<RegisterBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getApplicationTheme(isDarkMode: false),
        home: const SplashView(),
      ),
    );
  }
}
