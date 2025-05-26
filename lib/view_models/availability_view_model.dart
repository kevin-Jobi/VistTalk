import '../blocs/availability/availability_bloc.dart';
import '../blocs/availability/availability_event.dart';

class AvailabilityViewModel {
  final AvailabilityBloc availabilityBloc;

  AvailabilityViewModel(this.availabilityBloc);

  void toggleDay(String day) {
    availabilityBloc.add(ToggleDay(day));
  }

  void updateYearsOfExperience(String years) {
    availabilityBloc.add(UpdateYearsOfExperience(years));
  }

  void updateFees(String fees) {
    availabilityBloc.add(UpdateFees(fees));
  }

  void submitAvailability() {
    availabilityBloc.add(const SubmitAvailability());
  }
}