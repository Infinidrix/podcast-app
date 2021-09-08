import 'package:podcast_app/data_provider/downloaded_audio_provider/Idownloaded_audio_provider.dart';
import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio.dart';
import 'package:podcast_app/models/Podcast.dart';

import 'downloaded_audio.dart';

class DownloadedAudioProvider implements IDownloadedAudioProvider {
  final MyDatabase myDatabase = MyDatabase();

  DownloadedAudioProvider();

  @override
  Future<int> addDownloadedAudio(DownloadedAudiosCompanion downloadedAudio) {
    return myDatabase.addDownloadedAudio(downloadedAudio);
  }

  @override
  Future<List<DownloadedAudio>> get allDownloadedAudios =>
      myDatabase.allDownloadedAudios;

  @override
  Future<DownloadedAudio?> checkIfPodcastDownloaded(String id) {
    return myDatabase.checkIfPodcastDownloaded(id);
  }

  @override
  Future<List<Podcast>> replaceUrlIfDownloaded(List<Podcast> podcasts) async {
    return Future.wait(podcasts.map((podcast) async {
      final downloadedAudio =
          await myDatabase.checkIfPodcastDownloaded(podcast.id);
      if (downloadedAudio != null) {
        podcast.url = downloadedAudio.localFilePath;
      }
      return podcast;
    }));
  }
}
