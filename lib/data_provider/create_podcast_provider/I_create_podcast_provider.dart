import 'package:podcast_app/models/Podcast.dart';

abstract class ICreatePodcastProvider {
  Future<Podcast?> createPodcast(String filePath, String podcastTitle,
      String podcastDescription, String channelId, String userId);
}
