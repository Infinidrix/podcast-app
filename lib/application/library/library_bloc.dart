import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/library/library_events.dart';
import 'package:podcast_app/application/library/library_states.dart';
import 'package:podcast_app/models/Podcast.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  static List<Podcast> podcasts = [
    Podcast(
        name: "NASA Probe Mission",
        description:
            "There are objects in space and only a few of them are our fault.",
        numberOfListeners: 24000,
        url: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
        channelName: "NASA Podcast",
        id: "Unique ID"),
    Podcast(
        name: "Probe Mission",
        description: "There are objects are our fault.",
        numberOfListeners: 2400,
        url: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
        channelName: "NASA Podcast",
        id: "Unique ID"),
    Podcast(
        name: "NASA Mission",
        description: "There are a few of them are our fault.",
        numberOfListeners: 24000,
        url: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
        channelName: "NASA Podcast",
        id: "Unique ID")
  ];
  LibraryBloc() : super(LoadingLibraryState());

  @override
  Stream<LibraryState> mapEventToState(LibraryEvent event) async* {
    if (event is LoadLibraryEvent) {
      await Future.delayed(Duration(seconds: 2));
      yield InitialLibraryState(podcasts);
    }
  }
}
