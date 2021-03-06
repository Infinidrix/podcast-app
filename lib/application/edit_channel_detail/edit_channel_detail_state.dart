abstract class EditChannelDetailState {}

class EditChannelDetailInitialState extends EditChannelDetailState {}

class EditChannelDetailSuccessState extends EditChannelDetailState {}

class EditChannelDetailLoadingState extends EditChannelDetailState {}

class EditChannelDetailImageUploadedState extends EditChannelDetailState {
  final dynamic Image;
  EditChannelDetailImageUploadedState({required this.Image});
}

class EditChannelDetailFailedState extends EditChannelDetailState {
  final String ErrorMessage;

  EditChannelDetailFailedState({required this.ErrorMessage});
}
