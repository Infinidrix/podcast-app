import 'package:podcast_app/data_provider/audio_provider/Iaudio_provider.dart';

class AudioProvider implements IAudioProvider {
  @override
  Future<Null> addRecentlyPlayed(String id) async {
    await Future.delayed(Duration(seconds: 2), () {
      print("Added to recently played");
    });
  }

  Future<Null> downloadPodcast(String id) async {
    await Future.delayed(Duration(seconds: 25), () {
      print("downloaded audio");
    });
  }
}
