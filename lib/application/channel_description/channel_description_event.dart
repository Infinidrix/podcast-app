part of 'channel_description_bloc.dart';

@immutable
abstract class ChannelDescriptionEvent {}

class LoadInitialEvent extends ChannelDescriptionEvent {}

class SubscriptionEvent extends ChannelDescriptionEvent {
  final bool isSubscribing;

  String channelId;

  SubscriptionEvent(this.isSubscribing, this.channelId);
}
