abstract class EditChannelDetailState {}

class EditChannelDetailInitialState extends EditChannelDetailState {}

class EditChannelDetailSuccessState extends EditChannelDetailState {}

class EditChannelDetailImageUploadedState extends EditChannelDetailState {
  final dynamic Image;
  EditChannelDetailImageUploadedState({required this.Image});
}

class EditChannelDetailFailedState extends EditChannelDetailState {}
