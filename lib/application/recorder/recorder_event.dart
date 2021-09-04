abstract class RecorderEvent {}

class StartRecording extends RecorderEvent {}

class PauseRecordingEvent extends RecorderEvent {}

class StopRecordingEvent extends RecorderEvent {}

class ResumeRecordingEvent extends RecorderEvent {}
