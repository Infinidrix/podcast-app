import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_event.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_state.dart';

class CreatePodcastBloc extends Bloc<CreatePodcastEvent, CreatePodcastState> {
  CreatePodcastBloc(CreatePodcastState initialState) : super(initialState);

  @override
  Stream<CreatePodcastState> mapEventToState(CreatePodcastEvent event) async* {
    if (event is RecordEvent) {
      yield Recording();
      //TODO: IMPLEMENT RECORDING LOGIC
      print("recording");
      // yield Recorded();
    }

    if (event is FilePickEvent) {
      yield FilePicking();
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path);
        yield FilePicked(file: file);
      } else {
        yield FilePickingError();
      }
    }

    if (event is SaveEvent) {
      yield Saving();
      print("saving");
      // ignore: todo
      //TODO : IMPLEMENT SAVING LOGIC
      await Future.delayed(Duration(seconds: 3));
      print("saved");
      yield Saved();
    }
  }
}
