import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  TextEditingController emailContorller = TextEditingController();
  TextEditingController passwordContorller = TextEditingController();
  bool visible = false;
  void changeVisiblePassword() {
    visible = !visible;
    emit(LoginVisiblePasswordState());
  }

}
