import 'package:equatable/equatable.dart';

abstract class CertificateEvent extends Equatable {
  const CertificateEvent();

  @override
  List<Object> get props => [];
}

class UploadCertificate extends CertificateEvent {
  final String imagePath;
  const UploadCertificate(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}

class SubmitCertificate extends CertificateEvent {
  const SubmitCertificate();
}