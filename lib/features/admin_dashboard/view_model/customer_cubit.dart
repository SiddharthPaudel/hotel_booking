import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/use_case/get_current_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;

  CustomerCubit({required this.getCurrentUserUseCase}) : super(CustomerInitial());

  Future<void> fetchCurrentUser() async {
    emit(CustomerLoading());

    final result = await getCurrentUserUseCase.execute();
    
    result.fold(
      (failure) => emit(CustomerError(message: failure.message)),
      (user) => emit(CustomerLoaded(user: user)),
    );
  }
}
