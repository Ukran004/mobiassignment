// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:career_application/features/home/presentation/view_model/application_cubit.dart';
// import 'package:career_application/features/home/presentation/view_model/application_state.dart';

// class BookingsView extends StatelessWidget {
//   const BookingsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BookingCubit()..fetchBookings(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("My Bookings"),
//           backcompanyColor: Colors.deepPurple,
//         ),
//         body: BlocBuilder<BookingCubit, BookingState>(
//           builder: (context, state) {
//             if (state is BookingLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is BookingLoaded) {
//               return state.applications.isEmpty
//                   ? const Center(child: Text("No applications yet."))
//                   : ListView.builder(
//                       itemCount: state.applications.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(state.applications[index]),
//                           leading: const Icon(Icons.sports_soccer, color: Colors.deepPurple),
//                         );
//                       },
//                     );
//             } else if (state is BookingError) {
//               return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
//             } else {
//               return const Center(child: Text("Something went wrong!"));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:career_connect/features/home/data/model/booking_model.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_cubit.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit()..fetchBookings(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Bookings"),
          backgroundColor: Colors.deepPurple,
        ),
        body: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingLoaded) {
              final pastBookings =
                  state.applications.where((b) => b.isPast).toList();
              final upcomingBookings =
                  state.applications.where((b) => !b.isPast).toList();

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (upcomingBookings.isNotEmpty) ...[
                    const Text("Upcoming Bookings",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...upcomingBookings.map((application) => _buildBookingTile(
                        application, Color.fromARGB(255, 0, 37, 79))),
                  ],
                  if (pastBookings.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text("Past Bookings",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...pastBookings.map((application) =>
                        _buildBookingTile(application, Colors.red)),
                  ],
                  if (state.applications.isEmpty)
                    const Center(child: Text("No applications yet.")),
                ],
              );
            } else if (state is BookingError) {
              return Center(
                  child: Text(state.message,
                      style: const TextStyle(color: Colors.red)));
            } else {
              return const Center(child: Text("Something went wrong!"));
            }
          },
        ),
      ),
    );
  }

  Widget _buildBookingTile(Booking application, Color iconColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.sports_soccer, color: iconColor),
        title: Text(application.jobName),
        subtitle: Text(
            "Date: ${application.formattedDate} • Time: ${application.timeSlot}"),
        trailing: application.isPast
            ? const Icon(Icons.history,
                color: Color.fromARGB(255, 255, 255, 255))
            : const Icon(Icons.upcoming, color: Colors.blue),
      ),
    );
  }
}
