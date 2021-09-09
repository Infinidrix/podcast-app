import 'package:podcast_app/models/channel/Channel.dart';

abstract class EditChannelEvent {}

class LoadIntialEditChannelEvent extends EditChannelEvent {
  Channel channel;
  LoadIntialEditChannelEvent({
    required this.channel,
  });
}
