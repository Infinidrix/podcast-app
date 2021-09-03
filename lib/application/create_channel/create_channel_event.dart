import 'package:podcast_app/models/Channel.dart';

abstract class CreateChannelEvent {}

class CreateChannelSaveEvent extends CreateChannelEvent {
  final Channel channel;

  CreateChannelSaveEvent({required this.channel});
}
