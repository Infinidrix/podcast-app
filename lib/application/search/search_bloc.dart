import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:podcast_app/application/search/search_event.dart';
import 'package:podcast_app/application/search/search_state.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/repository/search_repository/ISearchRepository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepository repository;
  SearchBloc({required this.repository}) : super(SearchInitialState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    List<Podcast> recentlySearchedPodcast;
    List<Channel> recentlySearchedChannel;
    List<Podcast> resultPodcast;
    List<Channel> resultChannel;

    if (event is LoadIntialSearchEvent) {
      yield SearchLoadingState();
      recentlySearchedPodcast = await repository.recentPodcast();
      recentlySearchedChannel = await repository.recentChannel();

      yield LoadRecentlySearchedState(
        recentlySearchedChannel: recentlySearchedChannel,
        recentlySearchedPodcast: recentlySearchedPodcast,
      );
    }

    if (event is SearchingEvent) {
      yield SearchLoadingState();
      resultPodcast = await repository.searchPodcast(event.search);

      Either<String, List<Channel>> a =
          await repository.searchChannel(event.search);
      yield* a.fold((l) async* {
        yield SearchError(error: l);
      }, (r) async* {
        resultChannel = r;
        yield SearchResult(
          podcastResult: resultPodcast,
          channelResult: resultChannel,
        );
      });
    }
  }
}
