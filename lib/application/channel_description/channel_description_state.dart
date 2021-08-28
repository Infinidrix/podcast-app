part of 'channel_description_bloc.dart';

@immutable
abstract class ChannelDescriptionState {}

class InitialChannelDescriptionState extends ChannelDescriptionState {
  final Channel channel;
  final bool isSubscribed;

  InitialChannelDescriptionState(this.channel, this.isSubscribed);
}

class LoadingChannelDescriptionState extends ChannelDescriptionState {}
