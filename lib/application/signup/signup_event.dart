part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupButtonPressedEvent extends SignupEvent {
  final String Email;
  final String Password;
  final String UserName;

  SignupButtonPressedEvent(
      {required this.Email, required this.Password, required this.UserName});
}

class ShowOrHiddenPasswordButtonPressedSignupEvent extends SignupEvent {
  final bool isPaswordShown;

  ShowOrHiddenPasswordButtonPressedSignupEvent({required this.isPaswordShown});
}
