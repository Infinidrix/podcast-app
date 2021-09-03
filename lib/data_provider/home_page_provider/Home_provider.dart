import 'package:podcast_app/data_provider/home_page_provider/IHome_provider.dart';
import 'package:podcast_app/models/Channel.dart';

class HomeProvider implements IHomeProvider {
  List<Podcast> podcasts =
      List.generate(5, (index) => Podcast("Name #$index", index));

  List<Channel> channels = List.generate(
      4,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "ImageUrl",
          Subscribers: 12335245,
          Id: "$index",
          Podcasts: List.generate(10, (pod) => Podcast("Name #$pod", pod))));

  @override
  Future<List<Podcast>> getRecentlyPlayed() async {
    return podcasts;
  }

  @override
  Future<List<Channel>> getTopPicks() async {
    return channels;
  }

  @override
  Future<List<Podcast>> getTrending() async {
    return podcasts;
  }
}
