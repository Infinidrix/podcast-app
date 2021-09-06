import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class IHomePageRepository {
  Future<List<Channel>> getTopPicks();

  Future<List<Podcast>> getRecentlyPlayed();
  Future<List<Podcast>> getTrending();
}
