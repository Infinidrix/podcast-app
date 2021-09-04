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
      FilePickerResult? result;

      try {
        result = await FilePicker.platform.pickFiles(type: FileType.audio);
      } catch (e) {
        yield FilePickingError();
      }

      if (result != null) {
        File file = File(result.files.single.path);
        yield FilePicked(file: file);
      } else {
        yield FilePickingError();
      }
    }

    if (event is SaveEvent) {
      yield Saving();
      print(event.file?.path.toString());
      print(event.podcastDescription);
      print(event.podcastTitle);
      // ignore: todo
      //TODO : send received data to the repository
      await Future.delayed(Duration(seconds: 3));
      print("saved");
      yield Saved();
    }
  }
}
