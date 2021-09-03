import 'package:podcast_app/models/Channel.dart';

abstract class IHomePageRepository {
  Future<List<Channel>> getTopPicks();

  Future<List<Podcast>> getRecentlyPlayed();
  Future<List<Podcast>> getTrending();
}
