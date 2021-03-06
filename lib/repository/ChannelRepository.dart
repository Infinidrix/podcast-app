import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/channel/CreateChannel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

class ChannelRepository implements IChannelRepository {
  final IChannelProvider channelProvider;

  ChannelRepository({required this.channelProvider});

  @override
  Future<Channel> getChannel(String channelId) async {
    return channelProvider.getChannel(channelId);
  }

  @override
  Future<bool> isSubscribed(String userId, String channelId) {
    // TODO: implement isSubscribed
    return channelProvider.isSubscribed(userId, channelId);
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) {
    // TODO: implement setSubscription
    return channelProvider.setSubscription(
        userId, channelId, subscriptionStatus);
  }

  @override
  Future<Channel?> createChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL}) async {
    final channel =
        CreateChannel(Description: Description, Name: Name, Url: ImageURL);

    return await channelProvider.createChannel(createChannelInfo: channel);
  }

  Future<Channel?> editChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL,
      required String ChannelID}) async {
    final channel =
        CreateChannel(Description: Description, Name: Name, Url: ImageURL);

    return await channelProvider.editChannel(
        editChannelInfo: channel, ChannelID: ChannelID);
  }
}
