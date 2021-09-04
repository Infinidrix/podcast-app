abstract class RecorderEvent {}

class StartRecording extends RecorderEvent {}

class PauseEvent extends RecorderEvent {}

class Stop extends RecorderEvent {}
