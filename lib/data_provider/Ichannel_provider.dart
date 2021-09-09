import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/channel/CreateChannel.dart';

abstract class IChannelProvider {
  Future<Channel> getChannel(String id);

  Future<bool> isSubscribed(String userId, String channelId);
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus);
  Future<Either<String, Channel>> createChannel(
      {required Map<String, dynamic> createChannelInfo});
      Future<Either<String, Channel>> editChannel(
      {required Map<String, dynamic> editChannelInfo});
}
