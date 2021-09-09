abstract class EditChannelDetailEvent {}

class EditChannelDetailSaveEvent extends EditChannelDetailEvent {
  final String Name;
  final String Description;
  final String ChannelID;
  dynamic Image;

  EditChannelDetailSaveEvent(
      {required this.Name, required this.Description, required this.Image, required this.ChannelID});
}

class EditChannelChangeImageButtonPressedEvent extends EditChannelDetailEvent {
  final dynamic Image;

  EditChannelChangeImageButtonPressedEvent({required this.Image});
}
