import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_event.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_state.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';

class CreatePodcastBloc extends Bloc<CreatePodcastEvent, CreatePodcastState> {
  final CreatePodcastRepository createPodcastRepository;
  CreatePodcastBloc(
      CreatePodcastState initialState, this.createPodcastRepository)
      : super(initialState);

  @override
  Stream<CreatePodcastState> mapEventToState(CreatePodcastEvent event) async* {
    if (event is RecordEvent) {
      yield RecordState();
    }

    if (event is RecordedEvent) {
      try {
        final file = File(event.path);
        yield FilePicked(file: file);
      } catch (e) {
        yield FilePickingError();
      }
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
      String? id = await LoginProvider.SESSION.getString("userId");
      String userId;
      if (id != null) {
        userId = id;
      } else {
        userId = '1';
      }
      var isPodcastCreated = await createPodcastRepository.savePodcast(
        event.file,
        event.podcastTitle,
        event.podcastDescription,
        event.channelId,
        userId,
      );

      if (isPodcastCreated) {
        var channel = await createPodcastRepository.getChannel(event.channelId);

        yield Saved(channel: channel);
      } else {
        yield SavingError();
      }
    }
  }
}
