// part 'register.mocks.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/models/user_register/user_register.dart';
import 'package:podcast_app/repository/signup%20repository/i_signup_repository.dart';

import 'register_bloc_test.mocks.dart';

@GenerateMocks([ISignupRepository])
void main() {
  MockISignupRepository mockSignupRepository = MockISignupRepository();
  late SignupBloc bloc;
  void setUp() {
    bloc = SignupBloc(signupRepository: mockSignupRepository);
  }

  test("first state should be empty", () {
    setUp();
    expect(bloc.state, InitialSignupState());
  });

  group("LognBloc", () {
    UserRegister user = UserRegister(
        UserName: "UserName",
        Email: "Email",
        FirstName: "FirstName",
        LastName: "LastName",
        Password: "Password",
        ProfilePicture: "ProfilePicture");
    blocTest(
        'emits [ShowPasswordState] when ShowOrHiddenPasswordButtonPressedLoginEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (SignupBloc bloc) => bloc.add(
            ShowOrHiddenPasswordButtonPressedSignupEvent(isPaswordShown: true)),
        expect: () {
          return [
            LoadingSignupState(),
            ShowOrHiddenPasswordButtonPressedSignupState(isPasswordShown: false)
          ];
        });

    blocTest(
        'emits [SuccessSignupState] when SignupButtonPressedEvent is added.',
        build: () {
          when(
            mockSignupRepository.signup(
                email: "Email",
                userName: "UserName",
                password: "Password",
                firstName: "firstName",
                lastName: "lastName",
                profilePicturePath: "profilePicturePath.jppg"),
          ).thenAnswer((realInvocation) => Future.value(right(user)));
          setUp();
          return bloc;
        },
        act: (SignupBloc bloc) => bloc.add(SignupButtonPressedEvent(
            Email: "Email", Password: "Password", UserName: "UserName")),
        expect: () {
          return [LoadingSignupState(), SuccessSignupState()];
        });

    blocTest(
        'emits [ErrorFailureSignupState] when SignupButtonPressedEvent is added.',
        build: () {
          when(
            mockSignupRepository.signup(
                email: "Email",
                userName: "UserName",
                password: "Password",
                firstName: "firstName",
                lastName: "lastName",
                profilePicturePath: "profilePicturePath.jppg"),
          ).thenAnswer((realInvocation) => Future.value(left("user")));
          setUp();
          return bloc;
        },
        act: (SignupBloc bloc) => bloc.add(SignupButtonPressedEvent(
            Email: "Email", Password: "Password", UserName: "UserName")),
        expect: () {
          return [
            LoadingSignupState(),
            ErrorFailureSignupState(ErrorMessage: "user")
          ];
        });
  });
  // final user = LoginDtoModel(
  //   Token: "Token",
  //   user: User(
  //       FullName: "FullName",
  //       Email: "Email",
  //       UserName: "UserName",
  //       ProfilePicturePath: "ProfilePicturePath",
  //       Id: "Id"),
  //   expiration: "expiration",
  // );
}
