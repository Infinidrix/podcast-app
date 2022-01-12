import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/search_page_provider/ISearch_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class LocalSearchProvider extends ISearchProvider {
  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            name: "Podcast $index",
            numberOfListeners: 0,
            description: "",
            channelName: "",
            url: "",
            imageUrl: "assets/images/placeholder.jpg",
            id: "$index",
          ));

  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          name: "Name",
          profile_pic: "ImageUrl",
          subscriber: 12335245,
          id: "$index",
          description: "This is Channel Description",
          podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    channelName: "",
                    description: "",
                    url: "",
                    imageUrl: "assets/images/placeholder.jpg",
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
  Future<Either<String, List<Channel>>> searchChannel(String search) {
    // TODO: implement searchChannel
    throw UnimplementedError();
  }

  @override
  Future<List<Podcast>> searchPodcast(String search) {
    // TODO: implement searchPodcast
    throw UnimplementedError();
  }
}
