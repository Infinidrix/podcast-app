import 'package:podcast_app/models/channel/Channel.dart';

abstract class IYourChannelRepository {
  Future<List<Channel>> getMyChannels();
}
