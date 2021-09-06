
abstract class IAudioRepository {  
  Future<Null> addRecentlyPlayed(String id);

  Future<Null> downloadPodcast(String id);
}