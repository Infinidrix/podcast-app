
import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerState {
  AudioPlayer player;
  PodcastInfo podcast;

  AudioPlayerState({ required this.player, required this.podcast});
}
class LoadingAudioPlayerState extends AudioPlayerState {
  LoadingAudioPlayerState(AudioPlayer player, PodcastInfo podcast) : super(player: player, podcast: podcast);
}
class InitialAudioPlayerState extends AudioPlayerState {
  InitialAudioPlayerState(AudioPlayer player, PodcastInfo podcast) : super(player: player, podcast: podcast);
}

class AudioPlayerFailedState extends AudioPlayerState {
  final String errorMessage;
  AudioPlayerFailedState(AudioPlayer player, PodcastInfo podcast, this.errorMessage) : super(player: player, podcast: podcast);
}

class PodcastInfo {
  final String url;
  bool isPlaying;

  PodcastInfo(this.url, this.isPlaying);
}