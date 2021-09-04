import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class ISearchProvider {
  Future<List<Channel>> searchChannel(String search);

  Future<List<Podcast>> searchPodcast(String search);

  Future<List<Podcast>> recentlySearchedPodcast();
  Future<List<Channel>> recentlySearchedChannel();
}
