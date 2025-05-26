import 'package:flutter/material.dart';
import '../views/appointment_screen.dart';
import '../views/message_screen.dart';
import '../views/doctor_profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const BottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == currentIndex) return;
        Widget targetScreen;
        switch (index) {
          case 0:
            targetScreen = const AppointmentScreen();
            break;
          case 1:
            targetScreen = const MessageScreen();
            break;
          case 2:
            targetScreen = const DoctorProfileScreen();
            break;
          default:
            targetScreen = const AppointmentScreen();
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}