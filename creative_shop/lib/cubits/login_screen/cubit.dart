import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/login_model.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = false;
  void changeVisiblePassword() {
    visible = !visible;
    emit(LoginVisiblePasswordState());
  }

  void login(LoginModel model) async {
    emit(LoginLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      emit(LoginSuccessState(model));
    } on FirebaseAuthException catch (erorr) {
      if (erorr.code == "user-not-found") {
        emit(LoginErorrState("No user found for this email."));
      } else if (erorr.code == "wrong-password") {
        emit(LoginErorrState("Wrong password."));
      }
    } catch (e) {
      emit(LoginErorrState("Unknown erorr."));
    }
  }
}
