class Booking {
  final String jobName;
  final DateTime dateTime;
  final String timeSlot;

  Booking({required this.jobName, required this.dateTime, required this.timeSlot});

  /// Determines if the application is in the past
  bool get isPast => dateTime.isBefore(DateTime.now());

  /// Formats the date
  String get formattedDate => "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}
