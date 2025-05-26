import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/certificate/certificate_bloc.dart';
import '../blocs/certificate/certificate_state.dart';
import '../view_models/certificate_view_model.dart';
import 'appointment_screen.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final certificateBloc = BlocProvider.of<CertificateBloc>(context);
    final viewModel = CertificateViewModel(certificateBloc);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 247, 255),
        title: const Text(
          'Add Your Certificate',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ), // Larger and bolder text
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CertificateBloc, CertificateState>(
          builder: (context, state) {
            if (state.isSubmitting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.isSuccess) {
              return const Center(
                child: Text('Certificate Submitted Successfully!'),
              );
            }
            return Column(
              children: [
                SizedBox(height: 80),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewModel.uploadCertificate('certificate_image_path');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(
                            30,
                          ), // Increased padding
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 120, // Larger icon
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ), // More space between icon and text
                      const Text(
                        'Tap here to Add',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ), // Larger and bolder text
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    viewModel.submitCertificate();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppointmentScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
