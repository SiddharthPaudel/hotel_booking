import 'package:get_it/get_it.dart';
import 'package:hotel_booking/core/network/hive_service.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:hotel_booking/features/splash/presentation/view_model/splash_cubit.dart';


final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnboardingDependencies();
  await _initSplashScreenDependencies();
}

_initHiveDependencies() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}







_initRegisterDependencies() async {
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(),
  );
}



_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(registerBloc: getIt<RegisterBloc>()),
  );
}

  _initOnboardingDependencies() async {
  // Register any dependencies related to the onboarding screen, if needed.
  // Example: A cubit or bloc for onboarding:
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(
      getIt<OnboardingCubit>(),  // This is your LoginBloc dependency
    // Add OnboardingCubit if needed
    ),
  );
}
