
// import 'package:flutter/material.dart';

// class JobDetailPage extends StatefulWidget {
//   final String jobName;
//   final String jobImage;

//   const JobDetailPage({
//     Key? key,
//     required this.jobName,
//     required this.jobImage,
//   }) : super(key: key);

//   @override
//   _JobDetailPageState createState() => _JobDetailPageState();
// }

// class _JobDetailPageState extends State<JobDetailPage> {
//   String selectedDate = DateTime.now().toString().split(' ')[0];
//   String? selectedTimeSlot;

//   final List<String> timeSlots = [
//     '6:00 AM - 7:00 AM',
//     '7:00 AM - 8:00 AM',
//     '8:00 AM - 9:00 AM',
//     '9:00 AM - 10:00 AM',
//     '10:00 AM - 11:00 AM',
//     '11:00 AM - 12:00 PM',
//     '12:00 PM - 1:00 PM',
//     '1:00 PM - 2:00 PM',
//     '2:00 PM - 3:00 PM',
//     '3:00 PM - 4:00 PM',
//     '4:00 PM - 5:00 PM',
//     '5:00 PM - 6:00 PM',
//     '6:00 PM - 7:00 PM',
//     '7:00 PM - 8:00 PM',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.jobName),
//         backcompanyColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Court Image Section
//             Stack(
//               children: [
//                 Image.asset(
//                   widget.jobImage,
//                   height: 250,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.5),
//                         Colors.transparent,
//                         Colors.black.withOpacity(0.7),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 9,
//                   child: Text(
//                     widget.jobName,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Details Section with Backcompany Color
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Date Picker Section
//                   const Text(
//                     'Select Date',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   GestureDetector(
//                     onTap: () async {
//                       DateTime? picked = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime.now(),
//                         lastDate: DateTime.now().add(const Duration(days: 30)),
//                       );
//                       if (picked != null) {
//                         setState(() {
//                           selectedDate = picked.toString().split(' ')[0];
//                         });
//                       }
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                             color: Colors.deepPurple.withOpacity(0.5)),
//                       ),
//                       child: Text(
//                         selectedDate,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Time Slots Section
//                   const Text(
//                     'Available Time Slots',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 8,
//                       childAspectRatio: 3,
//                     ),
//                     itemCount: timeSlots.length,
//                     itemBuilder: (context, index) {
//                       final slot = timeSlots[index];
//                       final isSelected = selectedTimeSlot == slot;
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedTimeSlot = slot;
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: isSelected
//                                 ? Colors.deepPurple
//                                 : Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: Colors.deepPurple.withOpacity(0.5),
//                             ),
//                           ),
//                           alignment: Alignment.center,
//                           child: Text(
//                             slot,
//                             style: TextStyle(
//                               color:
//                                   isSelected ? Colors.white : Colors.deepPurple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 24),

//                   // Booking Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: selectedTimeSlot == null
//                           ? null
//                           : () {
//                               // Booking logic goes here
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                       "Booked for $selectedDate at $selectedTimeSlot"),
//                                 ),
//                               );
//                             },
//                       style: ElevatedButton.styleFrom(
//                         backcompanyColor: Colors.deepPurple,
//                         disabledBackcompanyColor: Colors.grey,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Book Now',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:career_connect/features/home/data/model/booking_model.dart';
import 'package:career_connect/features/home/presentation/view_model/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class JobDetailPage extends StatefulWidget {
  final String jobName;
  final String jobImage;

  const JobDetailPage({super.key, required this.jobName, required this.jobImage});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  final List<String> timeSlots = [
    "6:00 AM - 7:00 AM",
    "7:00 AM - 8:00 AM",
    "8:00 AM - 9:00 AM",
    "9:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "12:00 PM - 1:00 PM",
    "1:00 PM - 2:00 PM",
    "2:00 PM - 3:00 PM",
    "3:00 PM - 4:00 PM",
    "4:00 PM - 5:00 PM",
    "5:00 PM - 6:00 PM",
    "6:00 PM - 7:00 PM",
    "7:00 PM - 8:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(widget.jobName),
        backgroundColor: const Color(0xFF0056B3), // Professional Blue
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Court Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(widget.jobImage, height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),

            /// Select Date
            const Text("Select Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0056B3),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text("📅 Selected Date: ${selectedDate.toLocal().toString().split(' ')[0]}"),
            ),
            const SizedBox(height: 16),

            /// Select Time Slot
            const Text("Available Time Slots", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: timeSlots.map((time) {
                return ChoiceChip(
                  label: Text(time),
                  selected: selectedTime == time,
                  selectedColor: Colors.blueAccent,
                  onSelected: (selected) {
                    setState(() {
                      selectedTime = selected ? time : null;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            /// Book Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select a time slot!")));
                    return;
                  }
                  BlocProvider.of<BookingCubit>(context, listen: false).addBooking(Booking(
                    jobName: widget.jobName,
                    dateTime: selectedDate,
                    timeSlot: selectedTime!,
                  ));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text("✅ Confirm Booking", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
