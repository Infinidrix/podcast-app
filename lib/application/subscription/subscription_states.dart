import 'package:podcast_app/models/Channel.dart';

abstract class SubscriptionState {}

class LoadingSubscriptionState extends SubscriptionState {}

class InitialSubscriptionState extends SubscriptionState {
  List<Channel> channels;

  InitialSubscriptionState(this.channels);
}