import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class IChannelRepository {
  Future<Channel> getChannel(String channelId);
  Future<Either<String, Channel>> createChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL});
      Future<Either<String, Channel>> editChannel(
      {required String Name,
      required String Description,
      required dynamic ImageURL});
  Future<bool> isSubscribed(String channelId);
  Future<bool> setSubscription(String channelId, bool subscriptionStatus);
}
