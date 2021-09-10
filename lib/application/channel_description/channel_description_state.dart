part of 'channel_description_bloc.dart';

@immutable
abstract class ChannelDescriptionState {}

class FailedChannelDescriptionState extends ChannelDescriptionState {
  final String errorMessage;
  final Channel channel;

  FailedChannelDescriptionState(this.errorMessage, this.channel);
}

class InitialChannelDescriptionState extends ChannelDescriptionState {
  final Channel channel;
  final bool isSubscribed;

  InitialChannelDescriptionState(this.channel, this.isSubscribed);
}

class LoadingChannelDescriptionState extends ChannelDescriptionState {}
