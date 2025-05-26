import 'package:equatable/equatable.dart';
import '../../models/certificate_model.dart';

class CertificateState extends Equatable {
  final CertificateModel certificate;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  const CertificateState({
    required this.certificate,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  CertificateState copyWith({
    CertificateModel? certificate,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return CertificateState(
      certificate: certificate ?? this.certificate,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [certificate, isSubmitting, isSuccess, error];
}