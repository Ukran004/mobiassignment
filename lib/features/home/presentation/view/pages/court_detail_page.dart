import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  final String jobName;
  final String jobImage;

  const JobDetailPage({
    super.key,
    required this.jobName,
    required this.jobImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jobName),
        backgroundColor: Color.fromARGB(255, 0, 37, 79),
      ),
      body: Column(
        children: [
          Image.asset(jobImage,
              width: double.infinity, height: 250, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(
            jobName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Functionality coming soon!')),
              );
            },
            child: const Text('Apply'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
