import 'dart:async';

import 'package:career_connect/view/login.dart';
import 'package:flutter/material.dart';

// Adjust this import based on your project structure

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to LoginPage after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Minimize column height to its children
          children: [
            // Splash Screen Image
            Image.asset(
              'assets/images/image1.png', // Replace with your splash image path
              height: 200,
            ),
            const SizedBox(height: 30),

            // Loading Animation
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(height: 16),

            // Text below the loading animation
            const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
