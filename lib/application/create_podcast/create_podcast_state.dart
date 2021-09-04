import 'dart:io';

abstract class CreatePodcastState {}

class InitialState extends CreatePodcastState {}

class Recording extends CreatePodcastState {}

class RecordingError extends CreatePodcastState {}

class Recorded extends CreatePodcastState {
  final File file;
  Recorded({required this.file});
}

class FilePickingError extends CreatePodcastState {}

class FilePicked extends CreatePodcastState {
  final File file;
  FilePicked({required this.file});
}

class Saving extends CreatePodcastState {}

class SavingError extends CreatePodcastState {}

class Saved extends CreatePodcastState {}
