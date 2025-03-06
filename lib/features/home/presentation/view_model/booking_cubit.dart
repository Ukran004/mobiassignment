// import 'package:bloc/bloc.dart';
// import 'application_state.dart';

// class BookingCubit extends Cubit<BookingState> {
//   BookingCubit() : super(BookingInitial());

//   Future<void> fetchBookings() async {
//     try {
//       emit(BookingLoading());
//       // Simulate fetching data from an API or database
//       await Future.delayed(const Duration(seconds: 2));
//       emit(BookingLoaded(["Booking 1", "Booking 2", "Booking 3"]));
//     } catch (e) {
//       emit(BookingError("Failed to load applications"));
//     }
//   }
// }


import 'package:career_connect/features/home/data/model/booking_model.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingLoading());

  final List<Booking> _applications = []; // Stores all applications

  /// Fetch stored applications
  void fetchBookings() {
    emit(BookingLoaded(applications: List.from(_applications))); // Emit stored applications
  }

  /// Add a new application
  void addBooking(Booking application) {
    _applications.add(application);
    emit(BookingLoaded(applications: List.from(_applications))); // Emit updated list
  }
}
