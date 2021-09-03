import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_event.dart';
import 'package:podcast_app/application/recorder/recorder_state.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  RecorderBloc(RecorderState initialState) : super(initialState);

  @override
  Stream<RecorderState> mapEventToState(RecorderEvent event) async* {
    if (event is StartRecordingEvent) {
      //TODO : Start recording Audio
    } else if (event is PauseEvent) {
      //TODO : Pause Recording
    } else if (event is SaveEvent) {
      // TODO: Save the record
    }
  }
}
