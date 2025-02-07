import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view/home_view.dart';
import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../bottom_navigation/presentation/view_model/home_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;
  final LoginUserUsecase _loginUserUsecase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginUserUsecase loginUserUsecase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginUserUsecase = loginUserUsecase,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _registerBloc,
            child: event.destination,
          ),
        ),
      );
    });

    on<NavigateHomeScreenEvent>((event, emit) {
      Navigator.pushReplacement(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _homeCubit,
            child: event.destination,
          ),
        ),
      );
    });

    // Handle login event
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await _loginUserUsecase(
        LoginUserParams(
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
          showMySnackBar(
            context: event.context,
            message: "Invalid Credentials",
            color: Colors.red,
          );
        },
        (token) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
          add(
            NavigateHomeScreenEvent(
              context: event.context,
              destination: const HomeView(),
            ),
          );
          //_homeCubit.setToken(token);
        },
      );
    });
  }
}
