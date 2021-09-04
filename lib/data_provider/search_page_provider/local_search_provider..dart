import 'package:podcast_app/data_provider/search_page_provider/ISearch_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class LocalSearchProvider extends ISearchProvider {
  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            Name: "Podcast $index",
            NumberOfLitsners: 0,
            url: "",
            imageUrl: "",
            id: "$index",
          ));

  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "ImageUrl",
          Subscribers: 12335245,
          Id: "$index",
          Podcasts: List.generate(
              5,
              (index) => Podcast(
                    Name: "Podcast $index",
                    NumberOfLitsners: 0,
                    url: "",
                    imageUrl: "",
                    id: "$index",
                  ))));

  @override
  Future<List<Channel>> recentlySearchedChannel() async {
    await Future.delayed(Duration(seconds: 2));
    return channels;
  }

  @override
  Future<List<Podcast>> recentlySearchedPodcast() async {
    await Future.delayed(Duration(seconds: 2));
    return podcasts;
  }

  @override
  Future<List<Channel>> searchChannel(String search) {
    // TODO: implement searchChannel
    throw UnimplementedError();
  }

  @override
  Future<List<Podcast>> searchPodcast(String search) {
    // TODO: implement searchPodcast
    throw UnimplementedError();
  }
}
