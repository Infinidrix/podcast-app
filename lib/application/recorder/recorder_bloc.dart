import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart'
    as fs;
import 'package:podcast_app/application/recorder/recorder_event.dart';
import 'package:podcast_app/application/recorder/recorder_state.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  RecorderBloc(RecorderState initialState) : super(initialState);

  // initializing the recorder
  FlutterSoundRecorder? _recorder = FlutterSoundRecorder();

  @override
  Stream<RecorderState> mapEventToState(RecorderEvent event) async* {
    if (event is StartRecording) {
      yield Recording();
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
      await _recorder!.openAudioSession();
      try {
        await _recorder!.startRecorder(
          toFile: 'audio.mp4',
          codec: Codec.aacMP4,
          audioSource: fs.AudioSource.microphone,
        );
      } catch (e) {
        print(e);
      }
      print("recording");
    } else if (event is PauseRecordingEvent) {
      yield PauseState();
      await _recorder!.pauseRecorder();
      print("paused");
    } else if (event is ResumeRecordingEvent) {
      yield ResumedState();
      await _recorder!.resumeRecorder();
      print("Resumed");
    } else if (event is StopRecordingEvent) {
      await _recorder!.stopRecorder();
      yield StoppedState(
          path: '/data/user/0/com.example.podcast_app/cache/audio.mp4');
      print("stop");
    }

    if (event is FinishRecordingEvent) {
      _recorder!.closeAudioSession();
      _recorder = null;
    }
  }
}
