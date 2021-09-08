import 'package:podcast_app/data_provider/subscription_provider/ISubscriptionProvider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/subscription_repository/ISubscriptionRepository.dart';

class SubscriptionRepository extends ISubscriptionRepository {
  final ISubscriptionProvider apiProvider;

  SubscriptionRepository({required this.apiProvider});

  @override
  Future<List<Channel>> getSubscribedChannels(String userId) {
    return apiProvider.getSubscribedChannels(userId);
  }

  @override
  Future<Null> unsubscribe(String channelId, String userId) {
    return apiProvider.unsubscribe(channelId, userId);
  }
}
