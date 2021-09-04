part of 'channel_description_bloc.dart';

@immutable
abstract class ChannelDescriptionEvent {}

class LoadInitialEvent extends ChannelDescriptionEvent {}

class SubscriptionEvent extends ChannelDescriptionEvent {
  final bool isSubscribing;

  String channelId;

  SubscriptionEvent(this.isSubscribing, this.channelId);
}

// MultiBlocProvider(
// providers: [
// BlocProvider<BlocA>(
// create: (BuildContext context) => BlocA(),
// ),
// BlocProvider<BlocB>(
// create: (BuildContext context) => BlocB(),
// ),
// BlocProvider<BlocC>(
// create: (BuildContext context) => BlocC(),
// ),
// ],
// child: ChildA(),
// )
