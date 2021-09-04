import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio.dart';

abstract class IDownloadedAudioRepository {
  Future<List<DownloadedAudio>> getAllDownloadedAudios();

  Future<DownloadedAudio?> getPodcastById(String id); 

  Future<int> addDownloadAudio(DownloadedAudiosCompanion downloadedAudio);

}

