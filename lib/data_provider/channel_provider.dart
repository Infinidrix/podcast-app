import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/Channel.dart';

class ChannelPorvider implements IChannelProvider {
  List<Podcast> podcasts =
      List.generate(10, (index) => Podcast("Name #$index", index));
  Channel channel = Channel(
      Name: "Name",
      ImageUrl: "ImageUrl",
      Subscribers: 12335245,
      Id: "1",
      Podcasts: List.generate(10, (index) => Podcast("Name #$index", index)));
  bool isSubscribedValue = true;
  @override
  Future<bool> isSubscribed(String userId, String channelId) async {
    Future.delayed(Duration(seconds: 2));
    return isSubscribedValue;
  }

  @override
  Future<Channel> getChannel(String id) async {
    // TODO: implement getChannel
    Future.delayed(Duration(seconds: 2));
    return channel;
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    // TODO: implement setSubscription
    isSubscribedValue = subscriptionStatus;
    return isSubscribedValue;
  }
}
