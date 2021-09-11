part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {}

class InitialSignupState extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SuccessSignupState extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorFailureSignupState extends SignupState {
  final String ErrorMessage;

  ErrorFailureSignupState({required this.ErrorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [ErrorMessage];
}

class LoadingSignupState extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShowOrHiddenPasswordButtonPressedSignupState extends SignupState {
  final bool isPasswordShown;

  ShowOrHiddenPasswordButtonPressedSignupState({required this.isPasswordShown});

  @override
  // TODO: implement props
  List<Object?> get props => [isPasswordShown];
}
