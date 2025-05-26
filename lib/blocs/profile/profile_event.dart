import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateFullName extends ProfileEvent {
  final String fullName;
  const UpdateFullName(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class UpdateAge extends ProfileEvent {
  final String age;
  const UpdateAge(this.age);

  @override
  List<Object> get props => [age];
}

class UpdateDateOfBirth extends ProfileEvent {
  final String dateOfBirth;
  const UpdateDateOfBirth(this.dateOfBirth);

  @override
  List<Object> get props => [dateOfBirth];
}

class UpdateEmail extends ProfileEvent {
  final String email;
  const UpdateEmail(this.email);

  @override
  List<Object> get props => [email];
}

class UpdateGender extends ProfileEvent {
  final String gender;
  const UpdateGender(this.gender);

  @override
  List<Object> get props => [gender];
}

class UpdateHospitalName extends ProfileEvent {
  final String hospitalName;
  const UpdateHospitalName(this.hospitalName);

  @override
  List<Object> get props => [hospitalName];
}

class SubmitProfile extends ProfileEvent {
  const SubmitProfile();
}