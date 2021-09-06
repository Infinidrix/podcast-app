import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class IHomeProvider {
  Future<List<Channel>> getTopPicks();

  Future<List<Podcast>> getRecentlyPlayed();
  Future<List<Podcast>> getTrending();
}
