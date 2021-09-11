part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class InitialLoginState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorFailureLoginState extends LoginState {
  final String errorMessage;

  ErrorFailureLoginState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class ShowPasswordState extends LoginState {
  final bool isPasswordShown;
  ShowPasswordState({required this.isPasswordShown});

  @override
  // TODO: implement props
  List<Object?> get props => [isPasswordShown];
}

class LoadingLoginState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
