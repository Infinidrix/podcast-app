import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:podcast_app/application/home/home_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/home_page/home_page_state.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/application/sign_in/sign_in_bloc.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/user.dart';
import 'package:podcast_app/repository/home_page_repository/HomePageRepository.dart';
import 'package:podcast_app/repository/login_repository.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomePageRepository])
void main() {
  late HomePageBloc bloc;
  MockHomePageRepository mockLoginRepository = MockHomePageRepository();

  void setUp() {
    bloc = HomePageBloc(repository: mockLoginRepository);
  }

  test("intial", () {
    setUp();
    expect(bloc.state, LoadingHomePageState());
  });
  group("HomePageBloc", () {
    UserEditProfile temp = UserEditProfile(
      isCreator: false,
      UserName: "UserName",
      Email: "e@gmail.com",
      FirsName: "FirstName",
      LastName: "last",
      Password: "Password",
      ProfilePicture: 'assets/images/placeholder.jpg',
    );
    String SESSION = "test";
    blocTest(
        'emits [NavigateToProfileHomeState] when ProfileButtonPressedEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (HomePageBloc bloc) => bloc.add(ProfileButtonPressedEvent()),
        expect: () {
          return [isA<FailedHomePageState>()];
        });
  });
}
