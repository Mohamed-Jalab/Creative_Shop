import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.arrow_back_ios),
            const SizedBox(height: 20),
            const Text(
              ' Welcome to HandmadeHive!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: fullNameController,
                      hint: 'Full Name',
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: emailController,
                      hint: 'Email',
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: phoneController,
                      hint: 'Phone Number',
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hint: 'Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: 'By Signing up you agree to our ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms & Conditions ',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
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
