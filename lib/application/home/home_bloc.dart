import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialHomeState());
  UserEditProfile temp = UserEditProfile(
    UserName: "UserName",
    Email: "e@gmail.com",
    FirsName: "FirstName",
    LastName: "last",
    Password: "Password",
    ProfilePicture: 'assets/images/placeholder.jpg',
  );
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // TODO: Add your event logic

    if (event is ProfileButtonPressedEvent) {
      final userInfo =
          await LoginProvider.getItemFromLocalStorage(tokenName: "userInfo");
      UserEditProfile va = userInfo != null
          ? UserEditProfile.fromJson(jsonDecode(userInfo))
          : temp;
      yield NavigateToProfileHomeState(user: va);
    }
  }
}
