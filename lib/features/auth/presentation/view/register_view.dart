import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 16);
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: '');
  final _lnameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    Hive.openBox('users'); // Open Hive box for users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF415A77),
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF0D1B2A),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFBBDEFB),
                        ),
                      ),
                      const SizedBox(height: 24),
                      buildTextField(
                        controller: _fnameController,
                        labelText: 'First Name',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _lnameController,
                        labelText: 'Last Name',
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _phoneController,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _usernameController,
                        labelText: 'Username',
                        icon: Icons.account_circle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF415A77),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              final box = Hive.box('users');

                              if (box.containsKey(_usernameController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Username already exists!'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              await box.put(
                                _usernameController.text,
                                {
                                  'firstName': _fnameController.text,
                                  'lastName': _lnameController.text,
                                  'phone': _phoneController.text,
                                  'password': _passwordController.text,
                                },
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Registration successful! Please log in.'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFFBBDEFB)),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xFFBBDEFB),
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: const Color(0xFF1C2833),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFBBDEFB), width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: validator,
    );
  }
}
