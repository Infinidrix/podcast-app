import 'dart:io';

import 'package:podcast_app/data_provider/create_podcast_provider/create_podcast_provider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

class CreatePodcastRepository {
  final CreatePodcastProvider createPodcastProvider;

  CreatePodcastRepository(this.createPodcastProvider);

  Future<bool> savePodcast(File? file, String podcastTitle,
      String podcastDescription, String channelId, String? userId) async {
    Podcast? createdPodcast = await createPodcastProvider.createPodcast(
        file!.path.toString(),
        podcastTitle,
        podcastDescription,
        channelId,
        userId);
    if (createdPodcast == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<Channel> getChannel(String channelId){
    return  createPodcastProvider.getChannel(channelId);
  }
}
