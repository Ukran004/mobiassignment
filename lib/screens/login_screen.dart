// import 'package:Futsal_application/screens/dashboard_screen.dart';
// import 'package:flutter/material.dart';

// // import 'dashboard_screen.dart';
// import 'signup_screen.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   void _validateAndLogin() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => JobDashboardScreen()),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Backcompany Image with Blur Overlay
//           Positioned.fill(
//             child: Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/careerimage.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 color: Colors.black.withOpacity(0.6),
//               ),
//             ),
//           ),
//           // Main Content
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo
//                       Image.asset(
//                         'assets/images/logo.jpg',
//                         height: 80,
//                         fit: BoxFit.contain,
//                       ),
//                       const SizedBox(height: 20),
//                       // Welcome Text
//                       const Text(
//                         "Welcome Back!",
//                         style: TextStyle(
//                           fontFamily: 'Montserrat Regular',
//                           fontSize: 28,
//                           // fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         "Log in to continue",
//                         style: TextStyle(
//                           fontFamily: 'Montserrat Bold',
//                           fontSize: 16,
//                           color: Colors.white70,
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       // Email TextField
//                       TextFormField(
//                         controller: _emailController,
//                         style: const TextStyle(color: Colors.white),
//                         decoration: InputDecoration(
//                           labelText: "Email",
//                           labelStyle: const TextStyle(color: Colors.white70),
//                           prefixIcon:
//                               const Icon(Icons.email, color: Colors.white70),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.white54),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 const BorderSide(color: Colors.deepPurple),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.1),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!RegExp(
//                                   r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       // Password TextField
//                       TextFormField(
//                         controller: _passwordController,
//                         style: const TextStyle(color: Colors.white),
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           labelStyle: const TextStyle(color: Colors.white70),
//                           prefixIcon:
//                               const Icon(Icons.lock, color: Colors.white70),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.white54),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 const BorderSide(color: Colors.deepPurple),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.1),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       // Login Button
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backcompanyColor: Colors.deepPurple,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         onPressed: _validateAndLogin,
//                         child: const Text(
//                           "Login",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Social Login Buttons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.g_mobiledata,
//                                 color: Colors.redAccent, size: 40),
//                             onPressed: () {
//                               // Add Google login logic
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.apple,
//                                 color: Colors.white, size: 40),
//                             onPressed: () {
//                               // Add Apple login logic
//                             },
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       // Signup Redirect
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const SignupPage()),
//                           );
//                         },
//                         child: const Text(
//                           "Don't have an account? Sign Up",
//                           style: TextStyle(
                            
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ],
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
