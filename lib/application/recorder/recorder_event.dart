abstract class RecorderEvent {}

class StartRecordingEvent extends RecorderEvent {}

class PauseEvent extends RecorderEvent {}

class SaveEvent extends RecorderEvent {}
