import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login_screen/cubit.dart';
import '../cubits/login_screen/states.dart';
import '../models/login_model.dart';
import '../shared/component.dart';
import '../shared/constant.dart';
import 'home.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErorrState) {
            message(context, state.error);
          } else if (state is LoginSuccessState) {
            message(context, "Log In Successfully");
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
        },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                            controller: cubit.emailController,
                            text: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          buildTextField(
                              controller: cubit.passwordController,
                              obscure: !cubit.visible,
                              text: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              suffix: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                  icon: Icon(
                                    !cubit.visible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: greyColor2,
                                  ),
                                  onPressed: () =>
                                      cubit.changeVisiblePassword(),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    buildBigButton(context, onPressed: () async {
                      if (cubit.emailController.text != '' &&
                          cubit.passwordController.text != '') {
                        LoginModel userModel = LoginModel(
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                        );
                        cubit.login(userModel);
                      }
                    },
                        height: 48,
                        child: const Text('Log In',
                            style:
                                TextStyle(fontSize: 16, fontFamily: "Poppins")),
                        color: secondaryColor),
                    const SizedBox(height: 10),
                    if (state is LoginLoadingState)
                      LinearProgressIndicator(
                          color: secondaryColor,
                          backgroundColor: secondaryColor.withOpacity(.2)),
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
