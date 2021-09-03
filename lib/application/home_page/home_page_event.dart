import 'package:podcast_app/models/Channel.dart';

abstract class HomePageEvent {}

class LoadIntialEvent extends HomePageEvent {}

class TopPickClicked extends HomePageEvent {
  final String channelId;

  TopPickClicked(this.channelId);
}
