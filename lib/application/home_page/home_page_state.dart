import 'package:podcast_app/models/Channel.dart';

abstract class HomePageState {}

class LoadingHomePageState extends HomePageState {}

class LoadedHomePageState extends HomePageState {
  List<Channel> topPicks;
  List<Podcast> trending;
  List<Podcast> recentlyPlayed;
  LoadedHomePageState({
    required this.topPicks,
    required this.trending,
    required this.recentlyPlayed,
  });
}
