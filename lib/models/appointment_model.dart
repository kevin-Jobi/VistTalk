

class AppointmentModel {
  final String patientName;
  final String age;
  final String issue;
  final String status;
  final String type; // Online or Offline
  final String date;
  final double rating;

  AppointmentModel({
    required this.patientName,
    required this.age,
    required this.issue,
    required this.status,
    required this.type,
    required this.date,
    this.rating = 0.0,
  });
}
