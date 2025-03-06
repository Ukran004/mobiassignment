import 'package:career_connect/app/di/di.dart';
import 'package:career_connect/app/widget/app.dart';
import 'package:career_connect/core/network/hive_service.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive Database
  await HiveService.init();

  // Initialize Dependencies
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BookingCubit()), // Make BookingCubit globally available
      ],
      child: App(),
    ),
  );
}
