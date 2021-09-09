import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/channel/CreateChannel.dart';

abstract class IChannelProvider {
  Future<Channel> getChannel(String id);

  Future<bool> isSubscribed(String userId, String channelId);
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus);
  Future<Channel?> createChannel({required CreateChannel createChannelInfo});
  Future<Channel?> editChannel(
      {required CreateChannel editChannelInfo, required String ChannelID});
}
