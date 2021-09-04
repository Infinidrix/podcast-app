import 'dart:collection';
import 'dart:io';

import 'package:flowder/flowder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podcast_app/application/download/download_events.dart';
import 'package:podcast_app/application/download/download_states.dart';
import 'package:podcast_app/models/Podcast.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(LoadingDownloadState());

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    var currentState = this.state;
    print("Got to Download bloc with event: $event");
    if (event is AddToDownloadQueueEvent) {
      // TODO: Check if already downloaded
      if (currentState is LoadedDownloadState) {
        if (currentState.core == null) {
          final core = await downloadEpisode(event.podcast);
          // final core = null;
          currentState.podcasts.add(event.podcast);
          yield InitialDownloadState(currentState.podcasts, event.podcast,
              currentState.podcasts.length - 1, DownloadProgress(0, false),
              core: core);
        }
      } else {
        final core = await downloadEpisode(event.podcast);
        yield InitialDownloadState(ListQueue.from([event.podcast]),
            event.podcast, 0, DownloadProgress(0, false),
            core: core);
      }
    } else if (event is LoadInitialDownloadEvent) {
      if (currentState is LoadedDownloadState) {
        yield InitialDownloadState(
            currentState.podcasts,
            currentState.currentPodcast,
            currentState.index,
            currentState.downloadProgress);
      } else {
        yield InitialDownloadState(
            ListQueue(), null, 0, DownloadProgress(0, false));
      }
    } else if (event is UpdateProgressEvent) {
      if (currentState is LoadedDownloadState) {
        yield InitialDownloadState(
            currentState.podcasts,
            currentState.currentPodcast,
            currentState.index,
            DownloadProgress(event.current / event.total,
                currentState.downloadProgress.isPaused));
      } else {
        yield FailedDownloadState("Downloading on an empty queue");
      }
    } else if (event is PauseDownloadEvent) {
      if (currentState is LoadedDownloadState) {
        if (currentState.core != null) {
          await currentState.core!.pause();
          yield InitialDownloadState(
              currentState.podcasts,
              currentState.currentPodcast,
              currentState.index,
              DownloadProgress(currentState.downloadProgress.progress, true));
        } else {
          yield FailedLoadedDownloadState(
              "No ongoing downloads",
              currentState.podcasts,
              currentState.currentPodcast,
              currentState.index,
              currentState.downloadProgress);
        }
      } else {
        yield FailedDownloadState("Nothing inqueued");
      }
    } else if (event is ResumeDownloadEvent) {
      if (currentState is LoadedDownloadState) {
        if (currentState.core != null) {
          await currentState.core!.resume();
          yield InitialDownloadState(
              currentState.podcasts,
              currentState.currentPodcast,
              currentState.index,
              DownloadProgress(currentState.downloadProgress.progress, false));
        } else {
          yield FailedLoadedDownloadState(
              "No ongoing downloads",
              currentState.podcasts,
              currentState.currentPodcast,
              currentState.index,
              currentState.downloadProgress);
        }
      } else {
        yield FailedDownloadState("Nothing inqueued");
      }
    } else if (event is CompleteDownloadEvent) {
      if (currentState is LoadedDownloadState) {
        currentState.index++;
        if (currentState.index < currentState.podcasts.length) {
          currentState.currentPodcast =
              currentState.podcasts.elementAt(currentState.index);
          currentState.core =
              await downloadEpisode(currentState.currentPodcast!);
        } else {
          currentState.core = null;
        }
        yield InitialDownloadState(
            currentState.podcasts,
            currentState.currentPodcast,
            currentState.index,
            DownloadProgress(currentState.downloadProgress.progress, false));
      } else {
        yield FailedDownloadState("Internal Error: Download without queue");
      }
    }
  }

  // TODO: Move this to the download bloc
  Future<DownloaderCore> downloadEpisode(Podcast currentPodcast) async {
    String path = await getDocumentDir();
    DownloaderUtils options = DownloaderUtils(
      progressCallback: (current, total)
      {
        this.add(UpdateProgressEvent(current, total));
      },
      file: File('$path/${currentPodcast.id}.mp3'),
      progress: ProgressImplementation(),
      onDone: () => this.add(CompleteDownloadEvent()),
      deleteOnCancel: true,
    );
    DownloaderCore core = await Flowder.download(currentPodcast.url, options);
    return core;
  }

  Future<String> getDocumentDir() async {
    return (await getApplicationDocumentsDirectory()).path;
  }
}
