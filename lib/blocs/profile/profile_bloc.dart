import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import '../../models/profile_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(profile: ProfileModel())) {
    on<UpdateFullName>((event, emit) {
      emit(state.copyWith(
        profile: state.profile.copyWith(fullName: event.fullName),
      ));
    });

    on<UpdateAge>((event, emit) {
      emit(state.copyWith(
        profile: state.profile.copyWith(age: event.age),
      ));
    });

    on<UpdateDateOfBirth>((event, emit) {
      emit(state.copyWith(
        profile: state.profile.copyWith(dateOfBirth: event.dateOfBirth),
      ));
    });

    on<UpdateEmail>((event, emit) {
      emit(state.copyWith(
        profile: state.profile.copyWith(email: event.email),
      ));
    });

    on<UpdateGender>((event, emit) {
      emit(state.copyWith(
        profile: state.profile.copyWith(gender: event.gender),
      ));
    });

    on<UpdateHospitalName>((event, emit) {
      emit(state.copyWith(
        profile: state.profile.copyWith(hospitalName: event.hospitalName),
      ));
    });

    on<SubmitProfile>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}