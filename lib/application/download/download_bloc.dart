import 'dart:collection';
import 'dart:io';

import 'package:flowder/flowder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podcast_app/application/download/download_events.dart';
import 'package:podcast_app/application/download/download_states.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio.dart';
import 'package:podcast_app/repository/downloaded_audio_repository/download_audio_repository.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadedAudioRepository downloadedAudioRepository;
  DownloadBloc(this.downloadedAudioRepository) : super(LoadingDownloadState());

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    var currentState = this.state;
    print("Got to Download bloc with event: $event");
    if (event is AddToDownloadQueueEvent) {
      var podcast =
          await this.downloadedAudioRepository.getPodcastById(event.podcast.id);
      // TODO: Check if already downloaded
      if (currentState is LoadedDownloadState) {
        if (podcast != null) {
          yield FailedLoadedDownloadState(
              "Already Downloaded",
              currentState.podcasts,
              currentState.currentPodcast,
              currentState.index,
              currentState.downloadProgress,
              core: currentState.core);
        } else if (currentState.core == null) {
          final core = await downloadEpisode(event.podcast);
          // final core = null;
          currentState.podcasts.add(event.podcast);
          yield InitialDownloadState(currentState.podcasts, event.podcast,
              currentState.podcasts.length - 1, DownloadProgress(0, false),
              core: core);
        }
      } else {
        if (podcast != null) {
          yield FailedDownloadState("Already Downloaded");
        } else {
          final core = await downloadEpisode(event.podcast);
          yield InitialDownloadState(ListQueue.from([event.podcast]),
              event.podcast, 0, DownloadProgress(0, false),
              core: core);
        }
      }
    } else if (event is LoadInitialDownloadEvent) {
      if (currentState is LoadedDownloadState) {
        yield InitialDownloadState(
            currentState.podcasts,
            currentState.currentPodcast,
            currentState.index,
            currentState.downloadProgress);
      } else {
        var result =
            await this.downloadedAudioRepository.getAllDownloadedAudios();
        var podcasts = result.map((e) => Podcast(
            name: e.name,
            description: e.description,
            numberOfListeners: e.numberOfListeners,
            url: e.localFilePath,
            channelName: e.channelName,
            id: e.id));
        yield InitialDownloadState(ListQueue.from(podcasts), null,
            podcasts.length, DownloadProgress(0, false));
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
        String path = await getDocumentDir();
        DownloadedAudiosCompanion downloadedAudio = DownloadedAudiosCompanion(
            id: Value(currentState.currentPodcast!.id),
            name: Value(currentState.currentPodcast!.name),
            url: Value(currentState.currentPodcast!.url),
            channelName: Value(currentState.currentPodcast!.channelName),
            description: Value(currentState.currentPodcast!.description),
            localFilePath:
                Value('$path/${currentState.currentPodcast!.id}.mp3'));
        var result = await this
            .downloadedAudioRepository
            .addDownloadAudio(downloadedAudio);
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
      progressCallback: (current, total) {
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
