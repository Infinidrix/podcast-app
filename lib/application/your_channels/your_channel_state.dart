import 'package:podcast_app/models/channel/Channel.dart';

abstract class YourChannelState {}

class YourChannelInitialState extends YourChannelState {}

class LoadingYourChannel extends YourChannelState {}

class LoadedYourChannel extends YourChannelState {
  final List<Channel> channels;

  LoadedYourChannel(this.channels);
}
