// import 'package:equatable/equatable.dart';

// abstract class BookingState extends Equatable {
//   const BookingState();

//   @override
//   List<Object> get props => [];
// }

// class BookingInitial extends BookingState {}

// class BookingLoading extends BookingState {}

// class BookingLoaded extends BookingState {
//   final List<String> applications;
  
//   const BookingLoaded(this.applications);

//   @override
//   List<Object> get props => [applications];
// }

// class BookingError extends BookingState {
//   final String message;

//   const BookingError(this.message);

//   @override
//   List<Object> get props => [message];
// }


import 'package:career_connect/features/home/data/model/booking_model.dart';
import 'package:equatable/equatable.dart';


abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<Booking> applications;

  const BookingLoaded({required this.applications});

  @override
  List<Object> get props => [applications];
}

class BookingError extends BookingState {
  final String message;

  const BookingError({required this.message});

  @override
  List<Object> get props => [message];
}
