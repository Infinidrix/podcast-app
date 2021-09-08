import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class ILibraryRepository {
  Future<List<Podcast>> getRecentPodcasts(String userId);
}
