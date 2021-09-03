import 'package:bloc/bloc.dart';
import 'package:podcast_app/models/Channel.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(LoadingHomePageState());

  List<Podcast> trending =
      List.generate(10, (index) => Podcast("Name #$index", index));

  List<Podcast> recentlyPlayed =
      List.generate(10, (index) => Podcast("Name #$index", index));

  List<Channel> topPicks = List.generate(
      6,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "ImageUrl",
          Subscribers: 12335245,
          Id: "$index",
          Podcasts:
              List.generate(10, (index) => Podcast("Name #$index", index))));

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LoadIntialEvent) {
      yield LoadingHomePageState();
      await Future.delayed(Duration(
        seconds: 2,
      ));
      yield LoadedHomePageState(
        topPicks: topPicks,
        recentlyPlayed: recentlyPlayed,
        trending: trending,
      );
    }
  }
}
