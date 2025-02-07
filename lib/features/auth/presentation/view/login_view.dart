import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view/register_view.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:hotel_booking/features/bottom_navigation/presentation/view/home_view.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'siddhartha');
  final _passwordController = TextEditingController(text: 'test12345');

  bool _isPasswordVisible = false; // To toggle password visibility

  final _gap = const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // "Create Account" text with different colors
                    RichText(
                      text: TextSpan(
                        text: 'Welcome ',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Nunito',
                        ),
                        children: [
                          TextSpan(
                            text: 'Back',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                    ),
                    _gap, // Added gap
                    _gap, // Added gap

                    // Email TextField with Email Icon
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email,
                            color: Colors.black), // Black Email Icon
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: const TextStyle(fontFamily: 'Nunito'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    _gap, // Gap between email and password fields

                    // Password TextField with Eye Icon
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText:
                          !_isPasswordVisible, // Toggle password visibility
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock,
                            color: Colors.black), // Black Lock Icon
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility, // Eye Icon
                            color: Colors.black, // Black Eye Icon
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                                  !_isPasswordVisible; // Toggle visibility
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: const TextStyle(fontFamily: 'Nunito'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    _gap, // Gap between password field and button

                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          context.read<LoginBloc>().add(
                                LoginUserEvent(
                                  email: email,
                                  password: password,
                                  context: context,
                                ),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily:
                              'Nunito', // Set Nunito font to button text
                        ),
                      ),
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                      ),
                    ),
                    _gap, // Gap between button and sign-up text

                    // Sign-up navigation text
                    TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              NavigateRegisterScreenEvent(
                                context: context,
                                destination: RegisterView(),
                              ),
                            );
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily:
                              'Nunito', // Set Nunito font to TextButton text
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
