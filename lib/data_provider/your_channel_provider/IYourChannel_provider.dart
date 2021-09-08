import 'package:podcast_app/models/channel/Channel.dart';

abstract class IYourChannelProvider {
  Future<List<Channel>> getMyChannels(String userId);
}
