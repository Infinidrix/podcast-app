import 'package:podcast_app/models/Channel.dart';

abstract class ISearchRepository {
  Future<List<Channel>> searchChannel(String search);

  Future<List<Podcast>> searchPodcast(String search);

  Future<List<Podcast>> recentPodcast();
  Future<List<Channel>> recentChannel();
}
