

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/profile/profile_bloc.dart';
import 'blocs/availability/availability_bloc.dart';
import 'blocs/certificate/certificate_bloc.dart';
import 'blocs/appointment/appointment_bloc.dart';
import 'blocs/message/message_bloc.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => AvailabilityBloc()),
        BlocProvider(create: (context) => CertificateBloc()),
        BlocProvider(create: (context) => AppointmentBloc()),
        BlocProvider(create: (context) => MessageBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VistaCall',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen(),
      ),
    );
  }
}
