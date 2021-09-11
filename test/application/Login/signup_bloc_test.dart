import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/user.dart';
import 'package:podcast_app/repository/login_repository.dart';

import 'signup_bloc_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late LoginBloc bloc;
  MockLoginRepository mockLoginRepository = MockLoginRepository();

  void setUp() {
    bloc = LoginBloc(loginRepository: mockLoginRepository);
  }

  test("intial the state should be empty", () {
    setUp();
    expect(bloc.state, InitialLoginState());
  });
  group("LognBloc", () {
    final user = LoginDtoModel(
      Token: "Token",
      user: User(
          FullName: "FullName",
          Email: "Email",
          UserName: "UserName",
          ProfilePicturePath: "ProfilePicturePath",
          Id: "Id"),
      expiration: "expiration",
    );
    blocTest(
        'emits [ShowPasswordState] when ShowOrHiddenPasswordButtonPressedLoginEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (LoginBloc bloc) => bloc
            .add(ShowOrHiddenPasswordButtonPressedLoginEvent(isShown: true)),
        expect: () {
          return [
            LoadingLoginState(),
            ShowPasswordState(isPasswordShown: false)
          ];
        });
    blocTest('emits [LoginSuccessState] when LoginButtonPressedEvent is added.',
        build: () {
          when(
            mockLoginRepository.Login(
              "email",
              "password",
            ),
          ).thenAnswer((realInvocation) => Future.value(right(user)));
          setUp();
          return bloc;
        },
        act: (LoginBloc bloc) => bloc.add(
            LoginButtonPressedEvent(password: 'password', userName: 'email')),
        expect: () {
          return [LoadingLoginState(), LoginSuccessState()];
        });

    blocTest(
        'emits [ErrorFailureLoginState] when LoginButtonPressedEvent is added.',
        build: () {
          when(
            mockLoginRepository.Login(
              "email",
              "password",
            ),
          ).thenAnswer((realInvocation) => Future.value(left("user")));
          setUp();
          return bloc;
        },
        act: (LoginBloc bloc) => bloc.add(
            LoginButtonPressedEvent(password: 'password', userName: 'email')),
        expect: () {
          return [
            LoadingLoginState(),
            ErrorFailureLoginState(errorMessage: "user")
          ];
        });
  });
}
