import 'package:equatable/equatable.dart';
import '../../models/availability_model.dart';

class AvailabilityState extends Equatable {
  final AvailabilityModel availability;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  const AvailabilityState({
    required this.availability,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  AvailabilityState copyWith({
    AvailabilityModel? availability,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return AvailabilityState(
      availability: availability ?? this.availability,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [availability, isSubmitting, isSuccess, error];
}