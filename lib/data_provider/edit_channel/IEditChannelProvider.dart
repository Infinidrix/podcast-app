import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class IEditChannelProvider {
  Future<Either<String, Channel>> editPodcast(Podcast podcast, Channel channel);
  Future<Either<String, Channel>> deletePodcast(
      Podcast podcast, Channel channel);
}
