part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class InitialSignupState extends SignupState {}

class SuccessSignupState extends SignupState {}

class ErrorFailureSignupState extends SignupState {
  final String ErrorMessage;

  ErrorFailureSignupState({required this.ErrorMessage});
}

class LoadingSignupState extends SignupState {}

class ShowOrHiddenPasswordButtonPressedSignupState extends SignupState {
  final bool isPasswordShown;

  ShowOrHiddenPasswordButtonPressedSignupState({required this.isPasswordShown});
}
