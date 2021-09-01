

// TODO: Add @immutable
import 'audio_player_states.dart';

abstract class AudioPlayerEvent {}

class InitializePlayerEvent extends AudioPlayerEvent{
  PodcastInfo podcast;

  InitializePlayerEvent({required this.podcast});
}
class AudioPlayerFailedEvent extends AudioPlayerEvent {
  final String errorMessage;
  AudioPlayerFailedEvent(this.errorMessage);
}

class PlayAudioEvent extends AudioPlayerEvent {}

class PauseAudioEvent extends AudioPlayerEvent {}

class StopAudioEvent extends AudioPlayerEvent {}

class SeekAudioEvent extends AudioPlayerEvent {
  Duration newPosition;

  SeekAudioEvent({required this.newPosition});
}