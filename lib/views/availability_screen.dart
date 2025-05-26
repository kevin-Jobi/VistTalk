import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/availability/availability_bloc.dart';
import '../blocs/availability/availability_state.dart';
import '../view_models/availability_view_model.dart';
import 'certificate_screen.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final availabilityBloc = BlocProvider.of<AvailabilityBloc>(context);
    final viewModel = AvailabilityViewModel(availabilityBloc);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      appBar: AppBar(
        title: const Text('Select your Available days'),
        backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AvailabilityBloc, AvailabilityState>(
          builder: (context, state) {
            if (state.isSubmitting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.isSuccess) {
              return const Center(
                child: Text('Availability Submitted Successfully!'),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children:
                        ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((
                          day,
                        ) {
                          final isSelected = state.availability.availableDays
                              .contains(day);
                          return ChoiceChip(
                            label: Text(
                              day,
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            selected: isSelected,
                            selectedColor: const Color.fromARGB(
                              255,
                              84,
                              178,
                              255,
                            ), // Background when selected
                            backgroundColor: const Color.fromARGB(
                              255,
                              253,
                              252,
                              252,
                            ), // Background when not selected
                            onSelected: (selected) {
                              viewModel.toggleDay(day);
                            },
                          );
                        }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Years Of Experience',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 249, 248, 248),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: viewModel.updateYearsOfExperience,
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Fees (₹)',
                    // hintText: 'Search doctors, specialties...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 249, 248, 248),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: viewModel.updateFees,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    viewModel.submitAvailability();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CertificateScreen(),
                      ),
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
