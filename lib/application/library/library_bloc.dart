import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/library/library_events.dart';
import 'package:podcast_app/application/library/library_states.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/repository/library_repository/Ilibrary_repository.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final ILibraryRepository libraryRepository;
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
  LibraryBloc(this.libraryRepository) : super(LoadingLibraryState());

  @override
  Stream<LibraryState> mapEventToState(LibraryEvent event) async* {
    print("Got to the library state with event $event");
    if (event is LoadLibraryEvent) {
      try {
        final result = await libraryRepository.getRecentPodcasts("userId");
        print("Got out of result with $result");
        yield InitialLibraryState(result);
      } on Exception catch (e) {
        yield FailedLibraryState(e.toString());
      }
    }
  }
}
