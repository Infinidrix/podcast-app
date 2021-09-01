import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Map user = {'userName': "abdi", 'pass': "1234"};
  LoginBloc() : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: Add your event logic
    if (event is LoginButtonPressedEvent) {
      yield LoadingLoginState();
      print('here in login pressed event condition');
      // print()
      await Future.delayed(Duration(seconds: 4), () {
        print("Sending request to the internet");
      });
      if (user["userName"] == event.userName &&
          user['pass'] == event.password) {
        yield LoginSuccessState();
      } else {
        yield ErrorFailureLoginState(errorMessage: "errorMessage");
      }
    } else if (event is ShowOrHiddenPasswordButtonPressedLoginEvent) {
      yield LoadingLoginState();
      yield ShowPasswordState(isPasswordShown: !event.isShown);
    }
  }
}
