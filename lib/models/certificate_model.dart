class CertificateModel {
  final String? certificateImage;

  CertificateModel({this.certificateImage});

  CertificateModel copyWith({String? certificateImage}) {
    return CertificateModel(
      certificateImage: certificateImage ?? this.certificateImage,
    );
  }
}