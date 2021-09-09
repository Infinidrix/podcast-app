import 'dart:ffi';

import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class IEditChannelRepository {
  Future<bool> editPodcast(Podcast podcast);
  Future<bool> deletePodcast(Podcast podcast);
  Future<Channel> getChannel(String channelId);
}
