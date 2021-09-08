import 'package:podcast_app/data_provider/home_page_provider/IHome_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class HomeProvider implements IHomeProvider {
  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            name: "Podcast $index",
            numberOfListeners: 0,
            url:
                "http://192.168.43.110:44343/api/Users/b7d27747-e66f-403d-8bcb-2125656ccb53/Audios/4335478d-dd31-4e00-bdbf-60a2986ad1c0/download.mp3",
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
                    url: "",
                    description: "",
                    channelName: "",
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
