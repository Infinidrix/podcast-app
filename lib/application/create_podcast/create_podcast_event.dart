import 'dart:io';

abstract class CreatePodcastEvent {}

class RecordEvent extends CreatePodcastEvent {}

class FilePickEvent extends CreatePodcastEvent {}

class SaveEvent extends CreatePodcastEvent {
  final File? file;
  final String podcastTitle;
  final String podcastDescription;

  SaveEvent(
      {required this.file,
      required this.podcastTitle,
      required this.podcastDescription});
}
