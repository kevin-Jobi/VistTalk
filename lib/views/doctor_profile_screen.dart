

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile/profile_bloc.dart';
import '../blocs/profile/profile_state.dart';
import '../navigation/bottom_navigation.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Najin',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    // Navigate to edit profile screen (not implemented here)
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 248, 248),
                    ),
                    keyboardType: TextInputType.number,
                    // onChanged: viewModel.updateYearsOfExperience,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Age',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 248, 248),
                    ),
                    keyboardType: TextInputType.number,
                    // onChanged: viewModel.updateYearsOfExperience,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birt',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 248, 248),
                    ),
                    keyboardType: TextInputType.number,
                    // onChanged: viewModel.updateYearsOfExperience,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 248, 248),
                    ),
                    keyboardType: TextInputType.number,
                    // onChanged: viewModel.updateYearsOfExperience,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Category',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 248, 248),
                    ),
                    keyboardType: TextInputType.number,
                    // onChanged: viewModel.updateYearsOfExperience,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 2),
    );
  }
}
