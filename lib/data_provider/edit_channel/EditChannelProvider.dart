import 'dart:ffi';

import 'package:podcast_app/data_provider/edit_channel/IEditChannelProvider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

class EditChannelProvider extends IEditChannelProvider {
  @override
  Future<bool> DeletePodcast(Podcast podcast) async {
    await Future.delayed(Duration(seconds: 2));
    print("PROVIDER");
    return true;
  }

  @override
  Future<bool> EditPodcast(Podcast podcast) async {
    await Future.delayed(Duration(seconds: 2));
    print("PROVIDER");
    return true;
  }

  @override
  Future<Channel> getChannel(String channelId) async {
    // TODO: implement getChannel
    await Future.delayed(Duration(seconds: 2));
    return Channel(
        Name: "", ImageUrl: "", Subscribers: 12, Id: "dd", Description: "dd");
  }
}
