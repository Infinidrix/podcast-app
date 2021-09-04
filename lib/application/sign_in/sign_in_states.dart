

abstract class LoginState {}

class LoginLoading extends LoginState {}
class InitialState extends LoginState {}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed(this.errorMessage);
} 

class LoginSuccess extends LoginState {}