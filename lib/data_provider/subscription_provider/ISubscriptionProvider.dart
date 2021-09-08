import 'package:podcast_app/models/channel/Channel.dart';

abstract class ISubscriptionProvider {
  Future<List<Channel>> getSubscribedChannels(String userId);

  Future<Null> unsubscribe(String channelId, String userId);
}
