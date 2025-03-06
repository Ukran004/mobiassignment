import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Profile",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.person, color: Colors.teal),
            title: Text("Name: Kushal thapa"),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.teal),
            title: Text("Email: kushalthapa@gmail.com"),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Add Edit Profile functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}