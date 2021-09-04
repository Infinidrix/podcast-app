
abstract class SignInEvent {}

class LoginEvent extends SignInEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

