

import 'package:equatable/equatable.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class LoadAppointments extends AppointmentEvent {
  const LoadAppointments();
}

class AcceptAppointment extends AppointmentEvent {
  final int index;
  const AcceptAppointment(this.index);

  @override
  List<Object> get props => [index];
}

class CancelAppointment extends AppointmentEvent {
  final int index;
  const CancelAppointment(this.index);

  @override
  List<Object> get props => [index];
}