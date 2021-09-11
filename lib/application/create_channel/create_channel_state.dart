import 'package:equatable/equatable.dart';

abstract class CreateChannelState extends Equatable {}

class CreateChannelLoadingState extends CreateChannelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateChannelInitialState extends CreateChannelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateChannelSuccessState extends CreateChannelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateChannelFailedState extends CreateChannelState {
  final String ErrorMessage;

  CreateChannelFailedState({required this.ErrorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [ErrorMessage];
}

class OnImageUploadedState extends CreateChannelState {
  final dynamic image;

  OnImageUploadedState({this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [image];
  // OnImageUploadedState copyWith({});
}
