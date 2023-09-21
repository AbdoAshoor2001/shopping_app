abstract class SignUpStates {}

class InitSingUpStates extends SignUpStates {}

class LoadingSignUpState extends SignUpStates {}

class SucsessSignUpState extends SignUpStates {}

class FiledSignUpState extends SignUpStates {
  String? errorMessage;

  FiledSignUpState({required this.errorMessage});
}

class FiledSendDataToFireStore extends SignUpStates {}

class SucsessSendDataToFireStore extends SignUpStates {}
