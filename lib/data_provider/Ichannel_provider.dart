import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/CreateChannel.dart';

abstract class IChannelProvider {
  Future<Channel> getChannel(String id);

  Future<bool> isSubscribed(String userId, String channelId);
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus);
  Future<Either<String, Channel>> createChannel(
      {required Map<String, dynamic> createChannelInfo});
}
