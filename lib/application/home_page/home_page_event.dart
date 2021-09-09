abstract class HomePageEvent {}

class LoadIntialHomeEvent extends HomePageEvent {}

class TopPickClicked extends HomePageEvent {
  final String channelId;

  TopPickClicked(this.channelId);
}

class ProfileButtonPressedEvent extends HomePageEvent {}
