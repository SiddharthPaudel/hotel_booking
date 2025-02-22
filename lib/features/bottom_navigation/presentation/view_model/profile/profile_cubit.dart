import 'package:bloc/bloc.dart';
import 'package:hotel_booking/features/auth/domain/use_case/get_user_profile.dart';

import 'package:hotel_booking/features/bottom_navigation/presentation/view_model/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;

  ProfileCubit(this.getUserProfileUseCase) : super(ProfileInitial());

  Future<void> fetchUserProfile(String userId) async {
    emit(ProfileLoading());
    final result = await getUserProfileUseCase(userId);

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (userProfile) => emit(ProfileLoaded(userProfile: userProfile)),
    );
  }
}
