import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/search/search_bloc.dart';
import 'package:podcast_app/application/search/search_event.dart';
import 'package:podcast_app/data_provider/channel_provider.dart';
import 'package:podcast_app/data_provider/home_page_provider/Home_provider.dart';
import 'package:podcast_app/data_provider/search_page_provider/Search_provider.dart';
import 'package:podcast_app/data_provider/search_page_provider/local_search_provider..dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:podcast_app/repository/home_page_repository/HomePageRepository.dart';
import 'package:podcast_app/repository/search_repository/SearchRepository.dart';

class MyApp extends StatelessWidget {
  final _rootRouter = RootRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final channelRepository =
        ChannelRepository(channelProvider: ChannelPorvider());

    final searchRepository = SearchRepository(
        apiDataProvider: SearchProvider(),
        localDataProvider: LocalSearchProvider());

    final homePageRepository = HomePageRepository(dataProvider: HomeProvider());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ChannelDescriptionBloc(channelRepository: channelRepository)
                ..add(LoadInitialEvent()),
        ),
        BlocProvider(
            create: (_) => HomePageBloc(repository: homePageRepository)
              ..add(LoadIntialHomeEvent())),
        BlocProvider(
            create: (_) => SearchBloc(repository: searchRepository)
              ..add(LoadIntialSearchEvent()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        routerDelegate: AutoRouterDelegate(
          _rootRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: _rootRouter.defaultRouteParser(),
      ),
    );
  }
}


    // return BlocProvider(
    //   create: (_) =>
    //       ChannelDescriptionBloc(channelRepository: channelRepository)
    //         ..add(LoadInitialEvent()),
    //   child: MaterialApp.router(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       brightness: Brightness.dark,
    //     ),
    //     routerDelegate: AutoRouterDelegate(
    //       _rootRouter,
    //       navigatorObservers: () => [AutoRouteObserver()],
    //     ),
    //     routeInformationParser: _rootRouter.defaultRouteParser(),
    //   ),
    // );
