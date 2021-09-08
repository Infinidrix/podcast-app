import 'package:podcast_app/models/Podcast.dart';

abstract class ILibraryProvider {
  Future<List<Podcast>> getRecentPodcasts(String userId);
}
