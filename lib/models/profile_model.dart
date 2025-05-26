class ProfileModel {
  final String fullName;
  final String age;
  final String dateOfBirth;
  final String email;
  final String gender;
  final String hospitalName;

  ProfileModel({
    this.fullName = '',
    this.age = '',
    this.dateOfBirth = '',
    this.email = '',
    this.gender = '',
    this.hospitalName = '',
  });

  ProfileModel copyWith({
    String? fullName,
    String? age,
    String? dateOfBirth,
    String? email,
    String? gender,
    String? hospitalName,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      hospitalName: hospitalName ?? this.hospitalName,
    );
  }
}