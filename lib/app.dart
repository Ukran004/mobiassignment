import 'package:career_connect/core/app_theme/theme_data.dart';
import 'package:career_connect/view/home_page.dart';
import 'package:career_connect/view/landing_page.dart';
import 'package:career_connect/view/login.dart';
import 'package:career_connect/view/registration_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: LoginPage(),
        initialRoute: '/landing', // Set the initial route
        routes: {
          '/landing': (context) => const CareerConnectOnboardingView(),
          '/login': (context) => LoginPage(),
          '/registration': (context) => const RegistrationPage(),
          '/jobListing': (context) => const JobListingPage(),
          '/resume': (context) => const ResumePage(),
          '/saved': (context) => const SavedPage(),
          '/profile': (context) => const ProfilePage(),
        });
  }
}
