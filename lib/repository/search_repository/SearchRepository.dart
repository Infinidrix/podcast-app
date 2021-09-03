import 'package:podcast_app/data_provider/search_page_provider/ISearch_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/search_repository/ISearchRepository.dart';

class SearchRepository implements ISearchRepository {
  final ISearchProvider apiDataProvider;
  final ISearchProvider localDataProvider;

  SearchRepository(
      {required this.apiDataProvider, required this.localDataProvider});

  @override
  Future<List<Channel>> searchChannel(String search) async {
    return apiDataProvider.searchChannel(search);
  }

  @override
  Future<List<Podcast>> searchPodcast(String search) async {
    return apiDataProvider.searchPodcast(search);
  }

  @override
  Future<List<Channel>> recentChannel() async {
    return localDataProvider.recentlySearchedChannel();
  }

  @override
  Future<List<Podcast>> recentPodcast() async {
    return localDataProvider.recentlySearchedPodcast();
  }
}
