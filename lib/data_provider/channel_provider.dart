import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class ChannelPorvider implements IChannelProvider {
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

  bool isSubscribedValue = true;
  @override
  Future<bool> isSubscribed(String userId, String channelId) async {
    Future.delayed(Duration(seconds: 2));
    return isSubscribedValue;
  }

  @override
  Future<Channel> getChannel(String id) async {
    Future.delayed(Duration(seconds: 2));
    return channels[0];
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    isSubscribedValue = subscriptionStatus;
    return isSubscribedValue;
  }
}
