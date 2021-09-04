import 'dart:collection';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/repository/audio_repository/Iaudio_repository.dart';
import 'audio_player_states.dart';
import 'audio_player_events.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState>{
  IAudioRepository audioRepository;
  static final audioPlayer = AudioPlayer();
  
  AudioPlayerBloc(this.audioRepository): super(
      InitialAudioPlayerState(
        audioPlayer, 
        ListQueue.from([Podcast("NASA Probe Mission", 24000, "https://luan.xyz/files/audio/nasa_on_a_mission.mp3", "ayyyyyyD")]),
        AudioPlayerStatus(false, 0, Podcast("NASA Probe Mission", 24000, "https://luan.xyz/files/audio/nasa_on_a_mission.mp3", "ayyyyyyD")))){
    
    AudioPlayer.logEnabled = false;
    audioPlayer.onPlayerError.listen((event) { 
      this.add(AudioPlayerFailedEvent(event));
       });
    audioPlayer.onPlayerCompletion.listen((event) {
      print("We have arrived at player completed");
      this.add(PlayNextEvent());
    });
  }

  @override 
  Stream<AudioPlayerState> mapEventToState(event) async* {
    print("Got here with event: " + event.toString());

    if (event is InitializePlayerEvent){
      this.state.podcasts = event.podcasts;
      this.state.status.currentIndex = 0;
      this.state.status.currentPodcast = event.podcasts.first;
      this.add(PlayAudioEvent());
    } else if (event is PlayAudioEvent) {
      yield LoadingAudioPlayerState(this.state.player, this.state.podcasts, this.state.status);
      await this.state.player.stop();

      await this.state.player.play(this.state.status.currentPodcast.url);
      this.state.status.isPlaying = true;
      yield InitialAudioPlayerState(this.state.player, this.state.podcasts, this.state.status);
      
      await audioRepository.addRecentlyPlayed(this.state.status.currentPodcast.id);

    } else if (event is ResumeAudioEvent){

      this.state.status.isPlaying = true;
      yield InitialAudioPlayerState(this.state.player, this.state.podcasts, this.state.status);
      await this.state.player.resume();

    } else if (event is PauseAudioEvent) {

      this.state.status.isPlaying = false;
      yield InitialAudioPlayerState(this.state.player, this.state.podcasts, this.state.status);
      await this.state.player.pause();

    } else if (event is StopAudioEvent) {

      this.state.status.isPlaying = false;
      yield InitialAudioPlayerState(this.state.player, this.state.podcasts, this.state.status);
      await this.state.player.stop();

    } else if (event is SeekAudioEvent) {
      
      yield InitialAudioPlayerState(this.state.player, this.state.podcasts, this.state.status);
      await this.state.player.seek(event.newPosition);

    } else if (event is PlayNextEvent){
      if (this.state.status.currentIndex + 1 >= this.state.podcasts.length){
        yield AudioPlayerFailedState(this.state.player, this.state.podcasts, "Queue Finished", this.state.status);
      } else {
        this.state.status.currentIndex += 1;
        this.state.status.currentPodcast = this.state.podcasts.elementAt(this.state.status.currentIndex);
        this.add(PlayAudioEvent());
      }
    } else if (event is PlayPreviousEvent){
      if (this.state.status.currentIndex - 1 < 0){
        yield AudioPlayerFailedState(this.state.player, this.state.podcasts, "No Previous Podcasts", this.state.status);
      } else {
        this.state.status.currentIndex -= 1;
        this.state.status.currentPodcast = this.state.podcasts.elementAt(this.state.status.currentIndex);
        this.add(PlayAudioEvent());
      }
    } else if (event is DownloadEvent){
      await downloadEpisode(this.state.status.currentPodcast);
    } else if (event is AudioPlayerFailedEvent) {
      yield AudioPlayerFailedState(this.state.player, this.state.podcasts, event.errorMessage, this.state.status);
    }
  }

  Stream<Duration> currentPosition() async* {
    yield* this.state.player.onAudioPositionChanged;
  }

  Stream<Duration> fileDuration() async* {
    yield* this.state.player.onDurationChanged;
  }
}

// TODO: Move this to the download bloc
Future<void> downloadEpisode(Podcast currentPodcast) async {
  String path = await getDocumentDir();
  DownloaderUtils options = DownloaderUtils(
    progressCallback: (current, total) {
      final progress = (current / total) * 100;
      print('Downloading: $progress%');
    },
    file: File('$path/test_podcast.mp3'),
    progress: ProgressImplementation(),
    onDone: () => print('COMPLETE'),
    deleteOnCancel: true,
  );
  DownloaderCore core = await Flowder.download(
      currentPodcast.url,
      options);
}

Future<String> getDocumentDir() async {
  return (await getApplicationDocumentsDirectory()).path;
}