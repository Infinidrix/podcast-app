import 'dart:collection';

import 'package:flowder/flowder.dart';
import 'package:podcast_app/models/Podcast.dart';

abstract class DownloadState {}

class LoadingDownloadState extends DownloadState {}

class FailedDownloadState extends DownloadState {
  final String errorMessage;

  FailedDownloadState(this.errorMessage);
}

abstract class LoadedDownloadState extends DownloadState {
  ListQueue<Podcast> podcasts;
  DownloaderCore? core;
  Podcast? currentPodcast;
  DownloadProgress downloadProgress;
  int index;

  LoadedDownloadState(
      this.podcasts, this.currentPodcast, this.index, this.downloadProgress,
      {this.core});
}

class InitialDownloadState extends LoadedDownloadState {
  InitialDownloadState(ListQueue<Podcast> podcasts, Podcast? currentPodcast,
      int index, DownloadProgress progress,
      {DownloaderCore? core})
      : super(podcasts, currentPodcast, index, progress, core: core);
}

class FailedLoadedDownloadState extends LoadedDownloadState {
  final String errorMessage;
  FailedLoadedDownloadState(this.errorMessage, ListQueue<Podcast> podcasts,
      Podcast? currentPodcast, int index, DownloadProgress progress,
      {DownloaderCore? core})
      : super(podcasts, currentPodcast, index, progress, core: core);
}

class DownloadProgress {
  double progress;
  bool isPaused;

  DownloadProgress(this.progress, this.isPaused);
}
