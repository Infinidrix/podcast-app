part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {
  final String userName;
  final String password;

  LoginButtonPressedEvent({required this.userName, required this.password});
}

class CheckUserCredPersistedLoginEvent extends LoginEvent {}

class ShowOrHiddenPasswordButtonPressedLoginEvent extends LoginEvent {
  final bool isShown;

  ShowOrHiddenPasswordButtonPressedLoginEvent({required this.isShown});
}

// class LoadinIntial extends LoginEvent {}
