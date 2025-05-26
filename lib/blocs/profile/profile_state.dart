import 'package:equatable/equatable.dart';
import '../../models/profile_model.dart';

class ProfileState extends Equatable {
  final ProfileModel profile;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  const ProfileState({
    required this.profile,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  ProfileState copyWith({
    ProfileModel? profile,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [profile, isSubmitting, isSuccess, error];
}