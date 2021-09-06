abstract class CreateChannelState {}

class CreateChannelLoadingState extends CreateChannelState {}

class CreateChannelInitialState extends CreateChannelState {}

class CreateChannelSuccessState extends CreateChannelState {}

class CreateChannelFailedState extends CreateChannelState {
  final String ErrorMessage;

  CreateChannelFailedState({required this.ErrorMessage});
}

class OnImageUploadedState extends CreateChannelState {
  final dynamic image;

  OnImageUploadedState({this.image});
  // OnImageUploadedState copyWith({});
}
