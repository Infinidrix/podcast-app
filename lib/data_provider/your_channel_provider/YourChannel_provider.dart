import 'package:podcast_app/data_provider/your_channel_provider/IYourChannel_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class YourChannelProvider extends IYourChannelProvider {
  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "assets/images/1by1.png",
          Subscribers: 12335245,
          Id: "$index",
          Desctiption:
              "The Basement Yard is a weekly podcast hosted by Joe Santagato & featuring Danny LoPriore.",
          Podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    url: "",
                    description: "",
                    channelName: "",
                    imageUrl: "assets/images/1by1.png",
                    id: "$index",
                  ))));
  @override
  Future<List<Channel>> getMyChannels(String userId) async {
    await Future.delayed(Duration(seconds: 2));
    return channels;
  }
}
