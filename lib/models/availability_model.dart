class AvailabilityModel {
  final List<String> availableDays;
  final String yearsOfExperience;
  final String fees;

  AvailabilityModel({
    this.availableDays = const [],
    this.yearsOfExperience = '',
    this.fees = '',
  });

  AvailabilityModel copyWith({
    List<String>? availableDays,
    String? yearsOfExperience,
    String? fees,
  }) {
    return AvailabilityModel(
      availableDays: availableDays ?? this.availableDays,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      fees: fees ?? this.fees,
    );
  }
}