import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class ISearchProvider {
  Future<Either<String, List<Channel>>> searchChannel(String search);

  Future<List<Podcast>> searchPodcast(String search);

  Future<List<Podcast>> recentlySearchedPodcast();
  Future<List<Channel>> recentlySearchedChannel();
}
