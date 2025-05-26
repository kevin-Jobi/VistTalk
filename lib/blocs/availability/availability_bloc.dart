import 'package:flutter_bloc/flutter_bloc.dart';
import 'availability_event.dart';
import 'availability_state.dart';
import '../../models/availability_model.dart';

class AvailabilityBloc extends Bloc<AvailabilityEvent, AvailabilityState> {
  AvailabilityBloc() : super(AvailabilityState(availability: AvailabilityModel())) {
    on<ToggleDay>((event, emit) {
      final updatedDays = List<String>.from(state.availability.availableDays);
      if (updatedDays.contains(event.day)) {
        updatedDays.remove(event.day);
      } else {
        updatedDays.add(event.day);
      }
      emit(state.copyWith(
        availability: state.availability.copyWith(availableDays: updatedDays),
      ));
    });

    on<UpdateYearsOfExperience>((event, emit) {
      emit(state.copyWith(
        availability: state.availability.copyWith(yearsOfExperience: event.years),
      ));
    });

    on<UpdateFees>((event, emit) {
      emit(state.copyWith(
        availability: state.availability.copyWith(fees: event.fees),
      ));
    });

    on<SubmitAvailability>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}