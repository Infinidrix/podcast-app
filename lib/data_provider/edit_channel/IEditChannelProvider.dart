import 'dart:ffi';

import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class IEditChannelProvider {
  Future<bool> EditPodcast(Podcast podcast);
  Future<bool> DeletePodcast(Podcast podcast);
  Future<Channel> getChannel(String channelId);
}
