import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/core/network/api_service.dart';
import 'package:hotel_booking/core/network/hive_service.dart';
import 'package:hotel_booking/features/auth/data/data_source/remote_datasource/student_remote_data_source.dart';
import 'package:hotel_booking/features/auth/data/repository/user_remote_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view_model/home_cubit.dart';
import 'package:hotel_booking/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:hotel_booking/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveDependencies();
  await _initApiService();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  // await _initOnboardingDependencies();
  await _initSplashScreenDependencies();
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveDependencies() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initRegisterDependencies() async {
  if (!getIt.isRegistered<UserRemoteDataSource>()) {
    getIt.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSource(getIt<Dio>()),
    );
  }

  if (!getIt.isRegistered<UserRemoteRepository>()) {
    getIt.registerLazySingleton<UserRemoteRepository>(
        () => UserRemoteRepository(getIt<UserRemoteDataSource>()));
  }

  // Register CreateStudentUsecase
  getIt.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: getIt<UserRemoteRepository>()));

  // Register Upload Image Use Case
  getIt.registerLazySingleton<UploadImageUseCase>(
      () => UploadImageUseCase(getIt<UserRemoteRepository>()));

  // Register RegisterBloc
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUsecase: getIt<RegisterUsecase>(),
      uploadImageUseCase: getIt<UploadImageUseCase>(),
    ),
  );
}

_initLoginDependencies() async {
  if (!getIt.isRegistered<LoginUserUsecase>()) {
    getIt.registerLazySingleton<LoginUserUsecase>(
        () => LoginUserUsecase(repository: getIt<UserRemoteRepository>()));
  }

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUserUsecase: getIt<LoginUserUsecase>(),
    ),
  );
}

// _initOnboardingDependencies() async {
//   // Register any dependencies related to the onboarding screen, if needed.
//   // Example: A cubit or bloc for onboarding:
//   getIt.registerFactory<OnboardingCubit>(
//     () => OnboardingCubit(),
//   );
// }

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}

