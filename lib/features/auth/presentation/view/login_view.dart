import 'package:career_connect/core/app_theme/common/snackbar/my_snackbar.dart';
import 'package:career_connect/features/auth/presentation/view/register_view.dart';
import 'package:career_connect/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:career_connect/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _gap = const SizedBox(height: 16);

  @override
  void initState() {
    super.initState();
    Hive.openBox('users'); // Open Hive box for users
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Section with Image
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF1B263B),
                                Color(0xFF415A77),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/image2.jpg', // Path to your image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Welcome Message
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF9DBCD4),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Username Label
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Username Field
                        TextFormField(
                          key: const ValueKey('username'),
                          controller: _usernameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person,
                                color: Color(0xFF9DBCD4)),
                            filled: true,
                            fillColor: const Color(0xFF1E2A3A),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                        _gap,
                        // Password Label
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Password Field with Visibility Toggle
                        StatefulBuilder(
                          builder: (context, setState) {
                            bool isPasswordVisible = false;

                            return TextFormField(
                              key: const ValueKey('password'),
                              controller: _passwordController,
                              obscureText: !isPasswordVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock,
                                    color: Color(0xFF9DBCD4)),
                                filled: true,
                                fillColor: const Color(0xFF1E2A3A),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xFF9DBCD4),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              }),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        // Login Button
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final box = Hive.box('users');
                              final user = box.get(_usernameController.text);

                              if (user != null &&
                                  user['password'] ==
                                      _passwordController.text) {
                                context.read<LoginBloc>().add(
                                      NavigateHomeScreenEvent(
                                        destination: const HomeView(),
                                        context: context,
                                      ),
                                    );
                              } else {
                                showMySnackBar(
                                  context: context,
                                  message: 'Invalid username or password',
                                  color: Colors.red,
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF415A77),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 64),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Register Button
                        TextButton(
                          key: const ValueKey('registerButton'),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  NavigateRegisterScreenEvent(
                                    destination: RegisterView(),
                                    context: context,
                                  ),
                                );
                          },
                          child: const Text(
                            'Don’t have an account? Register',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF9DBCD4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
