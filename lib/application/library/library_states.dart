import 'package:podcast_app/models/Podcast.dart';

abstract class LibraryState {}

class LoadingLibraryState extends LibraryState {}

class FailedLibraryState extends LibraryState{
  String errorMessage;
  
  FailedLibraryState(this.errorMessage);
}

class InitialLibraryState extends LibraryState {
  final List<Podcast> podcasts;

  InitialLibraryState(this.podcasts);
}