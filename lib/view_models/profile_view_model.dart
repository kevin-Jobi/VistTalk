import '../blocs/profile/profile_bloc.dart';
import '../blocs/profile/profile_event.dart';

class ProfileViewModel {
  final ProfileBloc profileBloc;

  ProfileViewModel(this.profileBloc);

  void updateFullName(String fullName) {
    profileBloc.add(UpdateFullName(fullName));
  }

  void updateAge(String age) {
    profileBloc.add(UpdateAge(age));
  }

  void updateDateOfBirth(String dateOfBirth) {
    profileBloc.add(UpdateDateOfBirth(dateOfBirth));
  }

  void updateEmail(String email) {
    profileBloc.add(UpdateEmail(email));
  }

  void updateGender(String gender) {
    profileBloc.add(UpdateGender(gender));
  }

  void updateHospitalName(String hospitalName) {
    profileBloc.add(UpdateHospitalName(hospitalName));
  }

  void submitProfile() {
    profileBloc.add(const SubmitProfile());
  }
}