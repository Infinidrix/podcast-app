import 'package:podcast_app/models/Channel.dart';

abstract class IHomeProvider {
  Future<List<Channel>> getTopPicks();

  Future<List<Podcast>> getRecentlyPlayed();
  Future<List<Podcast>> getTrending();
}
