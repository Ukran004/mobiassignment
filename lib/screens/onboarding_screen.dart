// import 'package:Futsal_application/screens/login_screen.dart';
// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             children: const [
//               OnboardingPage(
//                 imagePath: 'assets/images/onboarding2.jpg',
//                 title: 'Welcome to Futsal Booking',
//                 description:
//                     'Book career matches seamlessly and manage your schedule effortlessly.',
//               ),
//               OnboardingPage(
//                 imagePath: 'assets/images/onboarding1.jpg',
//                 title: 'Find Your Perfect Match',
//                 description:
//                     'Connect with players and enjoy competitive matches tailored for you.',
//               ),
//               OnboardingPage(
//                 imagePath: 'assets/images/onboarding3.jpeg',
//                 title: 'Track Your Progress',
//                 description:
//                     'Keep a record of your games and performance with ease.',
//                 isLastPage: true,
//               ),
//             ],
//           ),
//           // Page Indicator
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 3,
//                 (index) => AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.symmetric(horizontal: 6),
//                   width: _currentIndex == index ? 20 : 12,
//                   height: 12,
//                   decoration: BoxDecoration(
//                     gradient: _currentIndex == index
//                         ? const LinearGradient(
//                             colors: [Colors.deepPurple, Colors.blueAccent],
//                           )
//                         : const LinearGradient(
//                             colors: [Colors.grey, Colors.grey],
//                           ),
//                     borderRadius: BorderRadius.circular(6),
//                     boxShadow: _currentIndex == index
//                         ? [
//                             BoxShadow(
//                               color: Colors.deepPurpleAccent.withOpacity(0.4),
//                               blurRadius: 8,
//                               spreadRadius: 1,
//                             ),
//                           ]
//                         : null,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingPage extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String description;
//   final bool isLastPage;

//   const OnboardingPage({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.description,
//     this.isLastPage = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Backcompany Image with Gradient Overlay
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(imagePath),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.4),
//                   BlendMode.darken,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Title
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   letterSpacing: 1.5,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),

//               // Description
//               Text(
//                 description,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.white70,
//                   height: 1.5,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 60),

//               // Get Started or Next Button
//               if (isLastPage)
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backcompanyColor: Colors.deepPurpleAccent,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 50, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
//                     elevation: 8,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Get Started",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
