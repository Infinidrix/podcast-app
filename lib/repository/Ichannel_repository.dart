import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/Channel.dart';

abstract class IChannelRepository {
  Future<Channel> getChannel(String channelId);
  Future<Either<String, Channel>> createChannel(
      {required String Name,
      required String Description,
      required String ImageURL});
  Future<bool> isSubscribed(String channelId);
  Future<bool> setSubscription(String channelId, bool subscriptionStatus);
}
