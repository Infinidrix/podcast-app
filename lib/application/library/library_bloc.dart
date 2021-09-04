import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/library/library_events.dart';
import 'package:podcast_app/application/library/library_states.dart';
import 'package:podcast_app/models/Podcast.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState>{
  static List<Podcast> podcasts = [
    Podcast(
      "NASA Probe Mission", 
      "There are objects in space and only a few of them are our fault.", 
      24000, 
      "test_podcast.mp3", 
      "NASA Podcast", 
      "Unique ID"
    ),
    Podcast(
      "Probe Mission", 
      "There are objects are our fault.", 
      2400, 
      "test_podcast.mp3", 
      "NASA Podcast", 
      "Unique ID"
    ),
    Podcast(
      "NASA Mission", 
      "There are a few of them are our fault.", 
      24000, 
      "test_podcast.mp3", 
      "NASA Podcast", 
      "Unique ID"
    )
  ]; 
  LibraryBloc(): super(
    LoadingLibraryState()
  );
  
  @override
  Stream<LibraryState> mapEventToState(LibraryEvent event) async* {
    if (event is LoadLibraryEvent){
      await Future.delayed(Duration(seconds: 2));
      yield InitialLibraryState(podcasts);
    } 
  }
  
}