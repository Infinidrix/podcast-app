import 'package:podcast_app/data_provider/home_page_provider/IHome_provider.dart';
import 'package:podcast_app/models/Channel.dart';

class HomeProvider implements IHomeProvider {
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
