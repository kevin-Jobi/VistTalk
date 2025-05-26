

import '../blocs/appointment/appointment_bloc.dart';
import '../blocs/appointment/appointment_event.dart';

class AppointmentViewModel {
  final AppointmentBloc appointmentBloc;

  AppointmentViewModel(this.appointmentBloc);

  void loadAppointments() {
    appointmentBloc.add(const LoadAppointments());
  }

  void acceptAppointment(int index) {
    appointmentBloc.add(AcceptAppointment(index));
  }

  void cancelAppointment(int index) {
    appointmentBloc.add(CancelAppointment(index));
  }
}