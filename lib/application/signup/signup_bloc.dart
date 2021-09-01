import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(InitialSignupState());
  final Map users = {
    'userName': "abdi",
    'pass': "12345678",
    'email': "a@gmail.com"
  };

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    // TODO: Add your event logic
    if (event is SignupButtonPressedEvent) {
      yield LoadingSignupState();
      await Future.delayed(Duration(seconds: 4), () {
        print("Sending request to the internet");
      });

      if (users["userName"] == event.UserName.trim() &&
          users['email'] == event.Email.trim() &&
          users['pass'] == event.Password.trim()) {
        print('success with register');
        yield SuccessSignupState();
      } else {
        yield ErrorFailureSignupState(ErrorMessage: "ErrorMessage");
      }
    } else if (event is ShowOrHiddenPasswordButtonPressedSignupEvent) {
      yield LoadingSignupState();
      yield ShowOrHiddenPasswordButtonPressedSignupState(
          isPasswordShown: !event.isPaswordShown);
    }
  }
}
