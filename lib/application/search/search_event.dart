abstract class SearchEvent {}

class SearchingEvent extends SearchEvent {
  String search;
  SearchingEvent({
    required this.search,
  });
}

class LoadIntialSearchEvent extends SearchEvent {}
