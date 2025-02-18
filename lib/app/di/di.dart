import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/app/shared_prefs/token_shared_prefs.dart';
import 'package:hotel_booking/core/network/api_service.dart';
import 'package:hotel_booking/core/network/hive_service.dart';
import 'package:hotel_booking/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
import 'package:hotel_booking/features/auth/data/data_source/remote_datasource/user_remote_data_source.dart';
import 'package:hotel_booking/features/auth/data/repository/user_local_repository.dart';
import 'package:hotel_booking/features/auth/data/repository/user_remote_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';

import 'package:hotel_booking/features/home/presentation/view_model/home_cubit.dart';
import 'package:hotel_booking/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:hotel_booking/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveDependencies();
  await _initApiService();
  await _initSharedPreferences();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initOnBoardingScreenDependencies();
  await _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initHiveDependencies() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initRegisterDependencies() async {
  // Local Data Source
  getIt
      .registerFactory<UserLocalDatasource>(() => UserLocalDatasource(getIt()));

  // Remote Data Source
  getIt.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSource(getIt<Dio>()));

  // Local Repository
  getIt.registerLazySingleton<UserLocalRepository>(() =>
      UserLocalRepository(userLocalDataSource: getIt<UserLocalDatasource>()));

  // Remote Repository
  getIt.registerLazySingleton<UserRemoteRepository>(
      () => UserRemoteRepository(getIt<UserRemoteDataSource>()));

  // Usecases
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(repository: getIt<UserRemoteRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUseCase>(
    () => UploadImageUseCase(
      getIt<UserRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUsecase: getIt<RegisterUsecase>(),
      uploadImageUseCase: getIt<UploadImageUseCase>(),
    ),
  );
}

_initOnBoardingScreenDependencies() async {
  getIt.registerFactory(
    () => OnboardingCubit(getIt<LoginBloc>()),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  // =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUserUsecase>(
    () => LoginUserUsecase(
      getIt<UserRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUserUsecase: getIt<LoginUserUsecase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}
