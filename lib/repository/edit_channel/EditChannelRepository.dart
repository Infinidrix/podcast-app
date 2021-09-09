import 'dart:ffi';

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
  Future<bool> deletePodcast(Podcast podcast) async {
    await apidataProvider.DeletePodcast(podcast);

    return true;
  }

  @override
  Future<bool> editPodcast(Podcast podcast) async {
    await apidataProvider.EditPodcast(podcast);
    return true;
  }

  @override
  Future<Channel> getChannel(String channelId) async {
    final result = await apidataProvider.getChannel(channelId);
    return result;
  }
}
