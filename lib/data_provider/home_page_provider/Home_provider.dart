import 'package:podcast_app/data_provider/home_page_provider/IHome_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class HomeProvider implements IHomeProvider {
  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            Name: "Podcast $index",
            NumberOfLitsners: 0,
            url: "",
            imageUrl: "assets/images/placeholder.jpg",
            id: "$index",
          ));
  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "assets/images/placeholder.jpg",
          Subscribers: 12335245,
          Id: "$index",
          Podcasts: List.generate(
              5,
              (index) => Podcast(
                    Name: "Podcast $index",
                    NumberOfLitsners: 0,
                    url: "",
                    imageUrl: "assets/images/placeholder.jpg",
                    id: "$index",
                  ))));

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
