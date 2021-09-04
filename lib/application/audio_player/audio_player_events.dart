

// TODO: Add @immutable
import 'dart:collection';

import 'package:podcast_app/models/Podcast.dart';

import 'audio_player_states.dart';

abstract class AudioPlayerEvent {}

class InitializePlayerEvent extends AudioPlayerEvent{
  ListQueue<Podcast> podcasts;

  InitializePlayerEvent({required this.podcasts});
}
class AudioPlayerFailedEvent extends AudioPlayerEvent {
  final String errorMessage;
  AudioPlayerFailedEvent(this.errorMessage);
}

class PlayAudioEvent extends AudioPlayerEvent {}

class ResumeAudioEvent extends AudioPlayerEvent {}

class PauseAudioEvent extends AudioPlayerEvent {}

class StopAudioEvent extends AudioPlayerEvent {}

class PlayNextEvent extends AudioPlayerEvent {}

class PlayPreviousEvent extends AudioPlayerEvent {}

// TODO: move this to download bloc
class DownloadEvent extends AudioPlayerEvent {}

class SeekAudioEvent extends AudioPlayerEvent {
  Duration newPosition;

  SeekAudioEvent({required this.newPosition});
}