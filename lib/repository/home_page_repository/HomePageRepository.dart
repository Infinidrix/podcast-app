import 'package:podcast_app/data_provider/home_page_provider/IHome_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/repository/home_page_repository/IHomePageRepository.dart';

class HomePageRepository implements IHomePageRepository {
  final IHomeProvider dataProvider;
  HomePageRepository({required this.dataProvider});

  @override
  Future<List<Podcast>> getRecentlyPlayed() async {
    return dataProvider.getRecentlyPlayed();
  }

  @override
  Future<List<Channel>> getTopPicks() async {
    return dataProvider.getTopPicks();
  }

  @override
  Future<List<Podcast>> getTrending() async {
    return dataProvider.getTrending();
  }
}
