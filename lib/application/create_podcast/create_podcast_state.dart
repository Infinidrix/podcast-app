import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class CreatePodcastState extends Equatable{}

class CreatePodcastInitialState extends CreatePodcastState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecordState extends CreatePodcastState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecordingError extends CreatePodcastState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Recorded extends CreatePodcastState {
  final File file;
  Recorded({required this.file});

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

class FilePickingError extends CreatePodcastState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FilePicked extends CreatePodcastState {
  final File file;
  FilePicked({required this.file});

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

class Saving extends CreatePodcastState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SavingError extends CreatePodcastState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Saved extends CreatePodcastState {
  Channel channel;
  Saved({required this.channel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
