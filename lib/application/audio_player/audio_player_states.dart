
import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class AudioPlayerState {
  AudioPlayer player;
  ListQueue<Podcast> podcasts;
  AudioPlayerStatus status;

  AudioPlayerState({ required this.player, required this.podcasts, required this.status});
}
class LoadingAudioPlayerState extends AudioPlayerState {
  LoadingAudioPlayerState(AudioPlayer player, ListQueue<Podcast> podcasts, AudioPlayerStatus status) : super(player: player, podcasts: podcasts, status: status);
}
class InitialAudioPlayerState extends AudioPlayerState {
  InitialAudioPlayerState(AudioPlayer player, ListQueue<Podcast> podcasts, AudioPlayerStatus status) : super(player: player, podcasts: podcasts, status: status);
}

class AudioPlayerFailedState extends AudioPlayerState {
  final String errorMessage;
  AudioPlayerFailedState(AudioPlayer player, ListQueue<Podcast> podcasts, this.errorMessage, AudioPlayerStatus status) : super(player: player, podcasts: podcasts, status: status);
}

class AudioPlayerStatus {
  bool isPlaying;
  Podcast currentPodcast;
  int currentIndex;

  AudioPlayerStatus(this.isPlaying, this.currentIndex, this.currentPodcast);
}