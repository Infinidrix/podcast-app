import 'package:podcast_app/models/Channel.dart';

abstract class IYourChannelProvider {
  Future<List<Channel>> getMyChannels(String userId);
}
