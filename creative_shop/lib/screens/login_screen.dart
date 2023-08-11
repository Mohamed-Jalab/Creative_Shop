import 'package:creative_shop/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../shared/component/component.dart';
import '../shared/component/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter the email address you\'d like to use to sign in to Creative Shop',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 20),
              // buildTextField(
              //   text: 'Username',
              // ),
              // const SizedBox(height: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: buildCheckbox("Remember me"),
                  ),
                  // need to work on it future
                  // buildTextButton('Forget Password'),
                ],
              ),
              const SizedBox(height: 5),
              buildBigButton(context,
                  onPressed: () {},
                  height: 48,
                  child: const Text('Log In',
                      style: TextStyle(fontSize: 16, fontFamily: "Poppins")),
                  color: redColor),
              // const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(fontFamily: 'Poppins')),
                  buildTextButton('Sign Up', onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SignUpScreen()));
                  }),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.grey.withOpacity(.4),
                    thickness: 2,
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Or Continue with',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey.withOpacity(.4),
                    thickness: 2,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: IconButton(
                  icon: Image.asset("asset/images/google-logo.png"),
                  onPressed: () {},
                ),
              ),
              // Center(
              //   child:
              //   buildBigButton(
              //     context,
              //     onPressed: () {},
              //     height: 55,
              //     color: blackColor2,
              //     padding: const EdgeInsets.symmetric(horizontal: 21),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Image.asset("asset/images/google-logo.png",
              //             width: 28.81, height: 28),
              //         // Spacer(),
              //         const Text('Contuine with google',
              //             style: TextStyle(fontSize: 18, fontFamily: 'Poppins'))
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
