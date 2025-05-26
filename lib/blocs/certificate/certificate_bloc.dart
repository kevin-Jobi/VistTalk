import 'package:flutter_bloc/flutter_bloc.dart';
import 'certificate_event.dart';
import 'certificate_state.dart';
import '../../models/certificate_model.dart';

class CertificateBloc extends Bloc<CertificateEvent, CertificateState> {
  CertificateBloc() : super(CertificateState(certificate: CertificateModel())) {
    on<UploadCertificate>((event, emit) {
      emit(state.copyWith(
        certificate: state.certificate.copyWith(certificateImage: event.imagePath),
      ));
    });

    on<SubmitCertificate>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}