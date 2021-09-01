part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class ErrorFailureLoginState extends LoginState {
  final String errorMessage;

  ErrorFailureLoginState({required this.errorMessage});
}

class ShowPasswordState extends LoginState {
  final bool isPasswordShown;
  ShowPasswordState({required this.isPasswordShown});
}

class LoadingLoginState extends LoginState {}

class LoginSuccessState extends LoginState {}
