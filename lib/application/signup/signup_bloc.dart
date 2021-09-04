import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/repository/signup%20repository/i_signup_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final ISignupRepository signupRepository;

  SignupBloc({required this.signupRepository}) : super(InitialSignupState());
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
      final userOrError = await signupRepository.signup(
          email: event.Email,
          userName: event.UserName,
          password: event.Password,
          firstName: "firstName",
          lastName: "lastName",
          profilePicturePath: "profilePicturePath.jppg");
      yield* userOrError.fold((errorMessagge) async* {
        yield ErrorFailureSignupState(ErrorMessage: errorMessagge);
      }, (userInfo) async* {
        yield SuccessSignupState();
      });
    } else if (event is ShowOrHiddenPasswordButtonPressedSignupEvent) {
      yield LoadingSignupState();
      yield ShowOrHiddenPasswordButtonPressedSignupState(
          isPasswordShown: !event.isPaswordShown);
    }
  }
}
