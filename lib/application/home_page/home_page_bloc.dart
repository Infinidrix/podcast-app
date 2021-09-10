import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/repository/home_page_repository/IHomePageRepository.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IHomePageRepository repository;
  HomePageBloc({required this.repository}) : super(LoadingHomePageState());

  UserEditProfile temp = UserEditProfile(
    isCreator: false,
    UserName: "UserName",
    Email: "e@gmail.com",
    FirsName: "FirstName",
    LastName: "last",
    Password: "Password",
    ProfilePicture: 'assets/images/placeholder.jpg',
  );

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    List<Podcast> trending;
    List<Podcast> recentlyPlayed;
    List<Channel> topPicks;
    try {
      if (event is LoadIntialHomeEvent) {
        yield LoadingHomePageState();
        trending = await repository.getTrending();
        topPicks = await repository.getTopPicks();
        recentlyPlayed = await repository.getRecentlyPlayed();

        yield LoadedHomePageState(
          topPicks: topPicks,
          recentlyPlayed: recentlyPlayed,
          trending: trending,
        );
      }

      if (event is ProfileButtonPressedEvent) {
        final userInfo =
            await LoginProvider.getItemFromLocalStorage(tokenName: "userInfo");
        UserEditProfile va = userInfo != null
            ? UserEditProfile.fromJson(jsonDecode(userInfo))
            : temp;
        yield NavigateToProfileHomeState(user: va);
        // yield LoadingHomePageState();
      }
    } catch (e) {
      yield FailedHomePageState(e.toString());
    }
  }
}
