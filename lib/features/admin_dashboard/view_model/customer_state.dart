part of 'customer_cubit.dart';

abstract class CustomerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final UserEntity user;
  CustomerLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class CustomerError extends CustomerState {
  final String message;
  CustomerError({required this.message});

  @override
  List<Object?> get props => [message];
}
