
import 'package:career_connect/app/app.dart';
import 'package:career_connect/app/di/di.dart';
import 'package:career_connect/core/network/hive_service.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive Database
  await HiveService.init();

  // Initialize Dependencies

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
