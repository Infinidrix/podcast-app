import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_event.dart';
import 'package:podcast_app/application/recorder/recorder_state.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  RecorderBloc(RecorderState initialState) : super(initialState);

  @override
  Stream<RecorderState> mapEventToState(RecorderEvent event) async* {
    if (event is StartRecording) {
      yield Recording();
      //TODO : Start recording Audio
      print("recording");
    } else if (event is PauseRecordingEvent) {
      yield PauseState();
      //TODO : Pause Recording
      print("paused");
    } else if (event is ResumeRecordingEvent) {
      yield ResumedState();
      //TODO : Resume Recording
      print("Resumed");
    } else if (event is StopRecordingEvent) {
      yield DialogState();
      // TODO: Save the record
      print("stop");
    }
  }
}
