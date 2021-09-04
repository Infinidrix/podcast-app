abstract class RecorderState {}

class RecorderInitialState extends RecorderState {}

class Recording extends RecorderState {}

class PauseState extends RecorderState {}

class ResumedState extends RecorderState {}

class DialogState extends RecorderState {}
