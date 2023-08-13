import '../../models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginVisiblePasswordState extends LoginStates {}

class LoginSccessState extends LoginStates {
  LoginModel model;
  LoginSccessState(this.model);
}

class LoginFailedState extends LoginStates {
  String error;
  LoginFailedState(this.error);
}
