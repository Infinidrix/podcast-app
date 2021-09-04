import 'dart:io';

abstract class CreatePodcastState {}

class InitialState extends CreatePodcastState {}

class Recording extends CreatePodcastState {}

class RecordingError extends CreatePodcastState {}

class Recorded extends CreatePodcastState {
  final File file;
  Recorded({required this.file});
}

class Uploading extends CreatePodcastState {}

class Uploaded extends CreatePodcastState {
  final File file;
  Uploaded({required this.file});
}

class UploadingError extends CreatePodcastState {}

class Saving extends CreatePodcastState {}

class SavingError extends CreatePodcastState {}

class Saved extends CreatePodcastState {}
