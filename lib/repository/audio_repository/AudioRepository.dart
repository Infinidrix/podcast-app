

import 'package:podcast_app/data_provider/audio_provider/Iaudio_provider.dart';
import 'package:podcast_app/repository/audio_repository/Iaudio_repository.dart';

class AudioRepository extends IAudioRepository{
  final IAudioProvider audioProvider;

  AudioRepository(this.audioProvider);

  @override
  Future<Null> addRecentlyPlayed(String id) {
    // TODO: implement addRecentlyPlayed
    return audioProvider.addRecentlyPlayed(id);
  }

  @override
  Future<Null> downloadPodcast(String id) {
    // TODO: implement downloadPodcast
    return audioProvider.downloadPodcast(id);
  }
  
}