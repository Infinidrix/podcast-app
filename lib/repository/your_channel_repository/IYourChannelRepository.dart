import 'package:podcast_app/models/Channel.dart';

abstract class IYourChannelRepository {
  Future<List<Channel>> getMyChannels();
}
