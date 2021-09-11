import 'package:equatable/equatable.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';

abstract class HomePageState extends Equatable {}

class LoadingHomePageState extends HomePageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedHomePageState extends HomePageState {
  String errorMessage;

  FailedHomePageState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class LoadedHomePageState extends HomePageState {
  List<Channel> topPicks;
  List<Podcast> trending;
  List<Podcast> recentlyPlayed;
  LoadedHomePageState({
    required this.topPicks,
    required this.trending,
    required this.recentlyPlayed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [topPicks, trending, recentlyPlayed];
}

class NavigateToProfileHomeState extends HomePageState {
  final UserEditProfile user;

  NavigateToProfileHomeState({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
