import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/home_page_repository/IHomePageRepository.dart';

class HomePageRepository implements IHomePageRepository {
  @override
  Future<List<Podcast>> getRecentlyPlayed() {
    // TODO: implement getRecentlyPlayed
    throw UnimplementedError();
  }

  @override
  Future<List<Channel>> getTopPicks(String channelId) {
    // TODO: implement getTopPicks
    throw UnimplementedError();
  }

  @override
  Future<List<Podcast>> getTrending() {
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}
