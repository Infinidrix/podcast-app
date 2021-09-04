
abstract class IAudioProvider {  
  Future<Null> addRecentlyPlayed(String id);

  Future<Null> downloadPodcast(String id);
}