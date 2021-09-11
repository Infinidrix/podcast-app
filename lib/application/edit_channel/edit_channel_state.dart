import 'package:podcast_app/models/channel/Channel.dart';

abstract class EditChannelState {}

// class EditChannelInitialState extends EditChannelState {}

class LoadingEditChannelState extends EditChannelState {}

class LoadedEditChannelState extends EditChannelState {
  Channel channel;
  LoadedEditChannelState({
    required this.channel,
  });
}

class ErrorEditChannelState extends EditChannelState {
  final String error;

  ErrorEditChannelState({required this.error});
}
