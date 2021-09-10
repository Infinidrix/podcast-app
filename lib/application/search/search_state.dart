import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class LoadRecentlySearchedState extends SearchState {
  List<Podcast> recentlySearchedPodcast;
  List<Channel> recentlySearchedChannel;
  LoadRecentlySearchedState({
    required this.recentlySearchedPodcast,
    required this.recentlySearchedChannel,
  });
}

class SearchResult extends SearchState {
  List<Podcast> podcastResult;
  List<Channel> channelResult;
  SearchResult({
    required this.podcastResult,
    required this.channelResult,
  });
}

class SearchError extends SearchState {
  String error;
  SearchError({
    required this.error,
  });
}
