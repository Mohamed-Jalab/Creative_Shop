import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login_screen/cubit.dart';
import '../cubits/login_screen/states.dart';
import '../shared/component/component.dart';
import '../shared/component/constant.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
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
                    Form(
                      child: Column(
                        children: [
                          buildTextField(
                            text: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          buildTextField(
                              obscure: !cubit.visible,
                              text: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              suffix: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                  icon: Icon(
                                    !cubit.visible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: greyColor2,
                                  ),
                                  onPressed: () =>
                                      cubit.changeVisiblePassword(),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                    buildBigButton(context,
                        onPressed: () {},
                        height: 48,
                        child: const Text('Log In',
                            style:
                                TextStyle(fontSize: 16, fontFamily: "Poppins")),
                        color: redColor),
                    // const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(fontFamily: 'Poppins')),
                        buildTextButton(
                          'Sign Up',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const SignUpScreen(),
                              ),
                            );
                          },
                        ),
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
                      child: GestureDetector(
                        child: Image.asset(
                          "asset/images/google-logo.png",
                          width: 33,
                          height: 33,
                        ),
                        onTap: () {},
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
