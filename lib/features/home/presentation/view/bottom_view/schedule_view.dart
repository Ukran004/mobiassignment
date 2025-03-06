import 'package:career_connect/features/home/data/model/booking_model.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_cubit.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Soft background
      appBar: AppBar(
        title: const Text("My Schedule",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor:
            Color.fromARGB(255, 0, 37, 79), // Matching Futsal Finder theme
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Past"),
          ],
        ),
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

            return TabBarView(
              controller: _tabController,
              children: [
                _buildBookingList(upcomingBookings, "No upcoming applications.",
                    Color.fromARGB(255, 0, 37, 79)),
                _buildBookingList(
                    pastBookings, "No past applications.", Colors.red),
              ],
            );
          } else {
            return const Center(child: Text("Something went wrong!"));
          }
        },
      ),
    );
  }

  /// Booking List UI
  Widget _buildBookingList(
      List<Booking> applications, String emptyMessage, Color color) {
    if (applications.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Icon(Icons.sports_soccer, color: color, size: 30),
            title: Text(
              application.jobName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            subtitle: Text(
              "📅 ${application.formattedDate}  |  ⏰ ${application.timeSlot}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: application.isPast
                ? const Icon(Icons.history, color: Colors.red)
                : const Icon(Icons.upcoming, color: Colors.blue),
          ),
        );
      },
    );
  }
}
