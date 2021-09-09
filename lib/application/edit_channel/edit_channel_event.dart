import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class EditChannelEvent {}

class LoadIntialEditChannelEvent extends EditChannelEvent {
  Channel channel;
  LoadIntialEditChannelEvent({
    required this.channel,
  });
}

class EditPodcastEvent extends EditChannelEvent {
  Podcast podcast;
  Channel channel;
  EditPodcastEvent({
    required this.podcast,
    required this.channel,
  });
}

class DeletePodcastEvent extends EditChannelEvent {
  Podcast podcast;
  Channel channel;
  DeletePodcastEvent({required this.podcast, required this.channel});
}
