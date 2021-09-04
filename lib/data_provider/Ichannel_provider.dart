import 'package:podcast_app/models/Channel.dart';

abstract class IChannelProvider {
  Future<Channel> getChannel(String id);

  Future<bool> isSubscribed(String userId, String channelId);
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus);
  Future<void>? createChannel(Channel channel);
}
