import 'dart:io';

import 'package:podcast_app/models/channel/Channel.dart';

abstract class CreatePodcastState {}

class CreatePodcastInitialState extends CreatePodcastState {}

class RecordState extends CreatePodcastState {}

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

class Saved extends CreatePodcastState {
  Channel channel;
  Saved({required this.channel});
}
