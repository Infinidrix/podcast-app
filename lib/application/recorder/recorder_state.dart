abstract class RecorderState {}

class RecorderInitialState extends RecorderState {}

class Recording extends RecorderState {}

class PauseState extends RecorderState {}

class ResumedState extends RecorderState {}

class StoppedState extends RecorderState {
  final String path;

  StoppedState({required this.path});
}
