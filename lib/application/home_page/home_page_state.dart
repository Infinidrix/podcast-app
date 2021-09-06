import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

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
