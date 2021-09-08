import 'package:podcast_app/models/Channel.dart';

abstract class SubscriptionState {}

class LoadingSubscriptionState extends SubscriptionState {}

class FailedSubscriptionState extends SubscriptionState {
  String errorMessage;

  FailedSubscriptionState(this.errorMessage);
}
class InitialSubscriptionState extends SubscriptionState {
  List<Channel> channels;

  InitialSubscriptionState(this.channels);
}