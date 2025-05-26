import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile/profile_bloc.dart';
import '../blocs/profile/profile_state.dart';
import '../view_models/profile_view_model.dart';
import 'availability_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    final viewModel = ProfileViewModel(profileBloc);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 247, 255),
        title: const Text('Add Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.isSubmitting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.isSuccess) {
              return const Center(
                child: Text('Profile Submitted Successfully!'),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    onChanged: viewModel.updateFullName,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    onChanged: viewModel.updateAge,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                    ),
                    onChanged: viewModel.updateDateOfBirth,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: viewModel.updateEmail,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Gender'),
                    items:
                        ['Male', 'Female', 'Other']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value != null) viewModel.updateGender(value);
                    },
                    value:
                        state.profile.gender.isNotEmpty
                            ? state.profile.gender
                            : null,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Hospital Name',
                    ),
                    onChanged: viewModel.updateHospitalName,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.submitProfile();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AvailabilityScreen(),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
