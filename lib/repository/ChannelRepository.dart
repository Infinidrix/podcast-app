import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

class ChannelRepository implements IChannelRepository {
  final userId = "1";
  // final  channelId = "1";
  final IChannelProvider channelProvider;

  ChannelRepository({required this.channelProvider});

  @override
  Future<Channel> getChannel(String channelId) async {
    // TODO: implement getChannel
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
}
