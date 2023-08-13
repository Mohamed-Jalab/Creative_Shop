
import 'package:creative_shop/shared/component/constant.dart';
import 'package:flutter/material.dart';

import '../shared/component/component.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const SizedBox(height: 20),
              const Text('Welcome to Creative Shop!',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 40),
              buildTextField(
                text: 'Username',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              buildTextField(
                text: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              buildTextField(
                text: 'Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 10),
              buildTextField(
                text: 'Confirm Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 15),
              buildBigButton(context,
                  onPressed: () {},
                  height: 48,
                  child: const Text('Sign Up',
                      style: TextStyle(fontSize: 16, fontFamily: "Poppins")),
                  color: redColor),
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.grey, fontSize: 12),
                  children: [
                    TextSpan(
                      text: "By Signing up you agree to our ",
                      // style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: "Terms & Conditions ",
                      style: TextStyle(color: redColor),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(color: redColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
