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

    if (event is UploadEvent) {
      yield Uploading();
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path);
        yield Uploaded(file: file);
      } else {
        yield UploadingError();
      }
    }

    if (event is SaveEvent) {
      yield Saving();
      // ignore: todo
      //TODO : IMPLEMENT SAVING LOGIC
      print("saved");
      yield Saved();
    }
  }
}
