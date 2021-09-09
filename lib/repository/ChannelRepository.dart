import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/channel/CreateChannel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

class ChannelRepository implements IChannelRepository {
  final userId = "1";
  // final  channelId = "1";
  final IChannelProvider channelProvider;

  ChannelRepository({required this.channelProvider});

  @override
  Future<Channel> getChannel(String channelId) async {
    return channelProvider.getChannel(channelId);
  }

  @override
  Future<bool> isSubscribed(String channelId) {
    // TODO: implement isSubscribed
    return channelProvider.isSubscribed(userId, channelId);
  }

  @override
  Future<bool> setSubscription(String channelId, bool subscriptionStatus) {
    // TODO: implement setSubscription
    return channelProvider.setSubscription(
        userId, channelId, subscriptionStatus);
  }

  @override
  Future<Either<String, Channel>> createChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL}) async {
    final channel =
        CreateChannel(Description: Description, Name: Name, Url: ImageURL);
        

    return await channelProvider.createChannel(
        createChannelInfo: channel.toJson());
  }

  Future<Either<String, Channel>> editChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL,
      required String ChannelID}) async {
    final channel =
        CreateChannel(Description: Description, Name: Name, Url: ImageURL);
        

    return await channelProvider.editChannel(
        editChannelInfo: channel.toJson(), ChannelID: ChannelID);
  }
}
