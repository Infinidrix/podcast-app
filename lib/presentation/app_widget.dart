import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_state.dart';
import 'package:podcast_app/data_provider/channel_provider.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';

class MyApp extends StatelessWidget {
  final _rootRouter = RootRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final channelRepository =
        ChannelRepository(channelProvider: ChannelPorvider());

    return MultiBlocProvider(
      providers: [
        BlocProvider<ChannelDescriptionBloc>(
          create: (_) =>
              ChannelDescriptionBloc(channelRepository: channelRepository)
                ..add(
                  LoadInitialEvent(),
                ),
        ),
        BlocProvider<CreatePodcastBloc>(
          create: (context) => CreatePodcastBloc(
              CreatePodcastInitialState(), CreatePodcastRepository()),
        )
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
