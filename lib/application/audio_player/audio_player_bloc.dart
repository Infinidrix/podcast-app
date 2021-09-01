import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'audio_player_states.dart';
import 'audio_player_events.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState>{
  static final audioPlayer = AudioPlayer();
  AudioPlayerBloc(): super(InitialAudioPlayerState(audioPlayer, PodcastInfo("Loading", false))){
    AudioPlayer.logEnabled = false;
    audioPlayer.onPlayerError.listen((event) { 
      this.add(AudioPlayerFailedEvent(event));
       });
    audioPlayer.onPlayerCompletion.listen((event) {
      print("We have arrived at player completed");
      this.add(StopAudioEvent());
    });
  }

  @override 
  Stream<AudioPlayerState> mapEventToState(event) async* {
    print("Got here with event: " + event.toString());
    if (event is InitializePlayerEvent){
      this.state.podcast = event.podcast;
      this.add(PlayAudioEvent());
    } else if (event is PlayAudioEvent) {
      yield LoadingAudioPlayerState(this.state.player, this.state.podcast);
      await this.state.player.stop();
      await this.state.player.play(this.state.podcast.url);

      this.state.podcast.isPlaying = true;
      yield InitialAudioPlayerState(this.state.player, this.state.podcast);
    } else if (event is PauseAudioEvent) {
      this.state.podcast.isPlaying = false;
      yield InitialAudioPlayerState(this.state.player, this.state.podcast);
      await this.state.player.pause();
    } else if (event is StopAudioEvent) {
      this.state.podcast.isPlaying = false;
      yield InitialAudioPlayerState(this.state.player, this.state.podcast);
      await this.state.player.stop();
    } else if (event is SeekAudioEvent) {
      yield InitialAudioPlayerState(this.state.player, this.state.podcast);
      await this.state.player.seek(event.newPosition);

    } else if (event is AudioPlayerFailedEvent) {
      yield AudioPlayerFailedState(this.state.player, this.state.podcast, event.errorMessage);
    }
  }

  Stream<Duration> currentPosition() async* {
    yield* this.state.player.onAudioPositionChanged;
  }

  Stream<Duration> fileDuration() async* {
    yield* this.state.player.onDurationChanged;
  }
}