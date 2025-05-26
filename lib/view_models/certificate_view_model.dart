import '../blocs/certificate/certificate_bloc.dart';
import '../blocs/certificate/certificate_event.dart';

class CertificateViewModel {
  final CertificateBloc certificateBloc;

  CertificateViewModel(this.certificateBloc);

  void uploadCertificate(String imagePath) {
    certificateBloc.add(UploadCertificate(imagePath));
  }

  void submitCertificate() {
    certificateBloc.add(const SubmitCertificate());
  }
}