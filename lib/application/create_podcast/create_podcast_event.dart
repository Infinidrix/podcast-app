import 'dart:io';

abstract class CreatePodcastEvent {}

class RecordEvent extends CreatePodcastEvent {}

class RecordedEvent extends CreatePodcastEvent {
  final String path;

  RecordedEvent(this.path);
}

class FilePickEvent extends CreatePodcastEvent {}

class SaveEvent extends CreatePodcastEvent {
  final File? file;
  final String podcastTitle;
  final String podcastDescription;
  final String channelId;

  SaveEvent(
      {required this.file,
      required this.podcastTitle,
      required this.podcastDescription,
      required this.channelId});
}
