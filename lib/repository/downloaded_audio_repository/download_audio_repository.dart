import 'package:podcast_app/data_provider/downloaded_audio_provider/Idownloaded_audio_provider.dart';
import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio.dart';
import 'package:podcast_app/repository/downloaded_audio_repository/Idownload_audio_repository.dart';

class DownloadedAudioRepository extends IDownloadedAudioRepository {
  final IDownloadedAudioProvider downloadedAudioProvider;

  DownloadedAudioRepository(this.downloadedAudioProvider);

  @override
  Future<int> addDownloadAudio(DownloadedAudiosCompanion downloadedAudio) {
    return downloadedAudioProvider.addDownloadedAudio(downloadedAudio);
  }

  @override
  Future<List<DownloadedAudio>> getAllDownloadedAudios() {
    return downloadedAudioProvider.allDownloadedAudios;
  }

  @override
  Future<DownloadedAudio?> getPodcastById(String id) {
    return downloadedAudioProvider.checkIfPodcastDownloaded(id);
  }

}