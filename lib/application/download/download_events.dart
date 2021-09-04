import 'package:podcast_app/models/Podcast.dart';

abstract class DownloadEvent {}

class AddToDownloadQueueEvent extends DownloadEvent {
  Podcast podcast;

  AddToDownloadQueueEvent(this.podcast);
}

class PauseDownloadEvent extends DownloadEvent {}

class LoadInitialDownloadEvent extends DownloadEvent {}

class ResumeDownloadEvent extends DownloadEvent {}

class UpdateProgressEvent extends DownloadEvent {
  int current, total;

  UpdateProgressEvent(this.current, this.total);
}

class CompleteDownloadEvent extends DownloadEvent {}