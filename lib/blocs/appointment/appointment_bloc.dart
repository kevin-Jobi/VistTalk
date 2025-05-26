


import 'package:flutter_bloc/flutter_bloc.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';
import '../../models/appointment_model.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(const AppointmentState()) {
    on<LoadAppointments>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(seconds: 2));
      final appointments = [
        AppointmentModel(
          patientName: 'Najin',
          age: '45 years old',
          issue: 'Back Pain',
          status: 'Upcoming',
          type: 'Online',
          date: '7/03/2024',
          rating: 0.0,
        ),
        AppointmentModel(
          patientName: 'Akshey',
          age: '21 year',
          issue: 'Heart Attack',
          status: 'Upcoming',
          type: 'Offline',
          date: '7/03/2024',
          rating: 0.0,
        ),
      ];
      emit(state.copyWith(appointments: appointments, isLoading: false));
    });

    on<AcceptAppointment>((event, emit) {
      final updatedAppointments = List<AppointmentModel>.from(state.appointments);
      updatedAppointments[event.index] = AppointmentModel(
        patientName: updatedAppointments[event.index].patientName,
        age: updatedAppointments[event.index].age,
        issue: updatedAppointments[event.index].issue,
        status: 'Confirmed',
        type: updatedAppointments[event.index].type,
        date: updatedAppointments[event.index].date,
        rating: updatedAppointments[event.index].rating,
      );
      emit(state.copyWith(appointments: updatedAppointments));
    });

    on<CancelAppointment>((event, emit) {
      final updatedAppointments = List<AppointmentModel>.from(state.appointments);
      updatedAppointments[event.index] = AppointmentModel(
        patientName: updatedAppointments[event.index].patientName,
        age: updatedAppointments[event.index].age,
        issue: updatedAppointments[event.index].issue,
        status: 'Canceled',
        type: updatedAppointments[event.index].type,
        date: updatedAppointments[event.index].date,
        rating: updatedAppointments[event.index].rating,
      );
      emit(state.copyWith(appointments: updatedAppointments));
    });
  }
}