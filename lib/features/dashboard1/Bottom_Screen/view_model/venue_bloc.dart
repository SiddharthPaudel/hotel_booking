import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/domain/entity/venue_entity.dart';
import 'package:hotel_booking/features/auth/domain/use_case/get_all_venues_usecase.dart';

import 'venue_event.dart';
import 'venue_state.dart';


class VenueBloc extends Bloc<VenueEvent, VenueState> {
  final GetVenuesUseCase _getVenuesUseCase;
  List<VenueEntity> _allVenues = [];

  VenueBloc(this._getVenuesUseCase) : super(VenueLoadingState()) {
    on<LoadVenuesEvent>((event, emit) async {
      emit(VenueLoadingState());
      final result = await _getVenuesUseCase();
      result.fold(
        (failure) => emit(VenueErrorState(failure.message)),
        (venues) {
          _allVenues = venues;
          emit(VenueLoadedState(venues));
        },
      );
    });

    on<SearchVenueEvent>((event, emit) {
      final filteredVenues = _allVenues
          .where((venue) => venue.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(VenueLoadedState(filteredVenues));
    });
  }
}
