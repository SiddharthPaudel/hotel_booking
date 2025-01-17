import 'package:bloc/bloc.dart';

class OnboardingState {
  final int currentPage;
  final bool isCompleted;

  OnboardingState({required this.currentPage, this.isCompleted = false});

  OnboardingState copyWith({int? currentPage, bool? isCompleted}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(currentPage: 0));

  void updatePage(int page) {
    emit(state.copyWith(currentPage: page));
  }

  void completeOnboarding() {
    emit(state.copyWith(isCompleted: true));
  }
}
