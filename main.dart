import 'package:career_connect/landing_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'home_page.dart';

void main() {
  runApp(CareerConnectApp());
}

class CareerConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/landing', // Set the initial route
      routes: {
        '/landing':(context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/jobListing': (context) => JobListingPage(),
      },
    );
  }
}
