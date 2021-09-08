import 'package:podcast_app/data_provider/library_provider/Ilibrary_provider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/library_repository/Ilibrary_repository.dart';

class LibraryRepository extends ILibraryRepository {
  final ILibraryProvider apiLibraryProvider;

  LibraryRepository({required this.apiLibraryProvider});

  @override
  Future<List<Podcast>> getRecentPodcasts(String userId) {
    return apiLibraryProvider.getRecentPodcasts(userId);
  }
}
