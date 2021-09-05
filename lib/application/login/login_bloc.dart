import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/repository/ilogin_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Map user = {'userName': "abdi", 'pass': "1234"};
  final ILoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: Add your event logic
    // await LoginProvider.SESSION.clear();
    // final userCredOrNot = await loginRepository.getPersistedUserCredOrNot();
    // print('userCrdOrNot in login bloc ${userCredOrNot}');
    // print(userCredOrNot.isRight());
    // var som = await LoginProvider.SESSION.getItem("userCred");
    // print('tring some new${som}');

    // if (userCredOrNot != null) {
    //   print('userCred from new imp ${userCredOrNot}');
    //   final userOrError = await loginRepository.Login(
    //       userCredOrNot.UserName, userCredOrNot.Password);
    //   print(userOrError);
    //   yield* userOrError.fold((errorMessage) async* {
    //     yield ErrorFailureLoginState(errorMessage: errorMessage);
    //   }, (r) async* {
    //     yield LoginSuccessState();
    //   });
    // }
    //

    // if (som != null) {
    //   yield LoginSuccessState();
    // }
    // yield* userCredOrNot.fold((l) async* {}, (userCred) async* {
    //   print('dont now what ${userCred.Password}');
    //   final userOrError =
    //       await loginRepository.Login(userCred.UserName, userCred.Password);
    //   bool _som = false;
    //   String? _temp = null;
    //   userOrError.fold((errorMessage) async {
    //     _temp = errorMessage;
    //     // yield ErrorFailureLoginState(errorMessage: errorMessage);
    //   }, (r) async {
    //     _som = true;
    //     // yield LoginSuccessState();
    //   });
    //   if (_som == true) {
    //     yield LoginSuccessState();
    //   } else if (_temp != null) {
    //     yield ErrorFailureLoginState(errorMessage: _temp!);
    //   }
    // });

    if (event is LoginButtonPressedEvent) {
      yield LoadingLoginState();

      print('here in login pressed event condition');
      // print()
      final userOrError =
          await loginRepository.Login(event.userName, event.password);
      print(userOrError);
      yield* userOrError.fold((errorMessage) async* {
        yield ErrorFailureLoginState(errorMessage: errorMessage);
      }, (r) async* {
        yield LoginSuccessState();
      });
    } else if (event is ShowOrHiddenPasswordButtonPressedLoginEvent) {
      yield LoadingLoginState();
      yield ShowPasswordState(isPasswordShown: !event.isShown);
    }
  }
}
