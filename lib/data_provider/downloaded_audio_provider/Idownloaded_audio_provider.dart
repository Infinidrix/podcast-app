
import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio.dart';

abstract class IDownloadedAudioProvider{
  Future<List<DownloadedAudio>> get allDownloadedAudios;

  Future<DownloadedAudio?> checkIfPodcastDownloaded(String id);
  
  Future<int> addDownloadedAudio(DownloadedAudiosCompanion downloadedAudio);
}