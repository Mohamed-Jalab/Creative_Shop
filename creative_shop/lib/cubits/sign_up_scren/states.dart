abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpVisiblePasswordState extends SignUpStates {}

class SignUpSccessState extends SignUpStates {
  
}

class SignUpFailedState extends SignUpStates {
  String error;
  SignUpFailedState(this.error);
}
