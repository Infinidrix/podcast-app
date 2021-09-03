import 'package:podcast_app/data_provider/search_page_provider/ISearch_provider.dart';
import 'package:podcast_app/models/Channel.dart';

class SearchProvider extends ISearchProvider {
  List<Podcast> podcasts =
      List.generate(5, (index) => Podcast("Name #$index", index));

  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "ImageUrl",
          Subscribers: 12335245,
          Id: "$index",
          Podcasts: List.generate(10, (pod) => Podcast("Name #$pod", pod))));
  Future<List<Channel>> searchChannel(String search) async {
    Future.delayed(Duration(seconds: 2));
    return channels;
  }

  @override
  Future<List<Podcast>> searchPodcast(String search) async {
    Future.delayed(Duration(seconds: 2));
    return podcasts;
  }

  @override
  Future<List<Channel>> recentlySearchedChannel() async {
    Future.delayed(Duration(seconds: 2));
    return channels;
  }

  @override
  Future<List<Podcast>> recentlySearchedPodcast() async {
    Future.delayed(Duration(seconds: 2));
    return podcasts;
  }
}
