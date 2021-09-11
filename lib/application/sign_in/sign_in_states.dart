import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class LoginSuccess extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
