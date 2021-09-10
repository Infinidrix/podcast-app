import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/edit_channel/IEditChannelProvider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/repository/edit_channel/IEditChannelRepositoy.dart';

class EditChannelRepository extends IEditChannelRepository {
  IEditChannelProvider apidataProvider;
  EditChannelRepository({
    required this.apidataProvider,
  });

  @override
  Future<Either<String, Channel>> deletePodcast(
      Podcast podcast, Channel channel) async {
    return apidataProvider.deletePodcast(podcast, channel);
  }

  @override
  Future<Either<String, Channel>> editPodcast(
      Podcast podcast, Channel channel) async {
    return apidataProvider.editPodcast(podcast, channel);
  }

  @override
  Future<Channel> getChannel(String channelId) {
    // TODO: implement getChannel
    throw UnimplementedError();
  }
}
