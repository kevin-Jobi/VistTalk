

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/appointment/appointment_bloc.dart';
import '../blocs/appointment/appointment_state.dart';
import '../view_models/appointment_view_model.dart';
import '../navigation/bottom_navigation.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentBloc = BlocProvider.of<AppointmentBloc>(context);
    final viewModel = AppointmentViewModel(appointmentBloc);

    viewModel.loadAppointments();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 241, 255),
        title: const Text('Hey, Fariz'),
        actions: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AppointmentBloc, AppointmentState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const DefaultTabController(
                  length: 3,
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Upcoming'),
                      Tab(text: 'Completed'),
                      Tab(text: 'Canceled'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.appointments.length,
                    itemBuilder: (context, index) {
                      final appointment = state.appointments[index];
                      if (appointment.status != 'Upcoming') {
                        return const SizedBox.shrink();
                      }
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appointment.patientName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${appointment.age} | ${appointment.issue}',
                                    ),
                                    Text('option : ${appointment.type}'),
                                    Text('Date: ${appointment.date}'),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      viewModel.acceptAppointment(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Accept'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      viewModel.cancelAppointment(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }
}
