import 'package:podcast_app/models/Channel.dart';

abstract class IChannelRepository {
  Future<Channel> getChannel(String channelId);

  Future<bool> isSubscribed(String channelId);
  Future<bool> setSubscription(String channelId, bool subscriptionStatus);
}
