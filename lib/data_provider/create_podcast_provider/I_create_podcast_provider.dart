import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class ICreatePodcastProvider {
  Future<Podcast?> createPodcast(String filePath, String podcastTitle,
      String podcastDescription, String channelId, String userId);

  Future<Channel> getChannel(String id);
}
