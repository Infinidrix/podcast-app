import 'package:podcast_app/data_provider/search_page_provider/ISearch_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class SearchProvider extends ISearchProvider {
  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            name: "Podcast $index",
            numberOfListeners: 0,
            url: "",
            description: "",
            channelName: "",
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
          Description: "This is Channel Description",
          Podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    description: "",
                    channelName: "",
                    url: "",
                    imageUrl: "assets/images/placeholder.jpg",
                    id: "$index",
                  ))));
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
