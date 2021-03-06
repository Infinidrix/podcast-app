import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class IChannelRepository {
  Future<Channel> getChannel(String channelId);
  Future<Channel?> createChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL});
  Future<Channel?> editChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL,
      required String ChannelID});
  Future<bool> isSubscribed(String userId, String channelId);
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus);
}
