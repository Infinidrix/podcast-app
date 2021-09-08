import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/library/library_bloc.dart';
import 'package:podcast_app/application/library/library_events.dart';
import 'package:podcast_app/application/search/search_bloc.dart';
import 'package:podcast_app/application/search/search_event.dart';
import 'package:podcast_app/application/your_channels/your_channel_bloc.dart';
import 'package:podcast_app/application/your_channels/your_channel_event.dart';
import 'package:podcast_app/data_provider/channel_provider.dart';
import 'package:podcast_app/data_provider/home_page_provider/Home_provider.dart';
import 'package:podcast_app/data_provider/library_provider/library_provider.dart';
import 'package:podcast_app/data_provider/search_page_provider/Search_provider.dart';
import 'package:podcast_app/data_provider/search_page_provider/local_search_provider..dart';
import 'package:podcast_app/data_provider/subscription_provider/SubscriptionProvider.dart';
import 'package:podcast_app/data_provider/your_channel_provider/YourChannel_provider.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:podcast_app/repository/home_page_repository/HomePageRepository.dart';
import 'package:podcast_app/repository/library_repository/library_repository.dart';
import 'package:podcast_app/repository/search_repository/SearchRepository.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_events.dart';
import 'package:podcast_app/application/edit_profile/edit_profile_bloc.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_application.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_events.dart';
import 'package:podcast_app/application/wellcome/wellcome_bloc.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/data_provider/sugnup/signup_provider.dart';

import 'package:podcast_app/data_provider/audio_provider/audio_provider.dart';
import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio_provider.dart';
import 'package:podcast_app/data_provider/edit_profile/edit_profile_provider.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';
import 'package:podcast_app/repository/audio_repository/AudioRepository.dart';
import 'package:podcast_app/repository/downloaded_audio_repository/download_audio_repository.dart';
import 'package:podcast_app/repository/edit_profile_repository/edit_profile_repository.dart';
import 'package:podcast_app/repository/login_repository.dart';
import 'package:podcast_app/repository/signup%20repository/SignupRepository.dart';
import 'package:podcast_app/repository/subscription_repository/SubscriptionRepository.dart';
import 'package:podcast_app/repository/your_channel_repository/YourChannelRepository.dart';

class MyApp extends StatelessWidget {
  final _rootRouter = RootRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final channelRepository = ChannelRepository(
        channelProvider: ChannelPorvider(httpClient: http.Client()));

    final searchRepository = SearchRepository(
        apiDataProvider: SearchProvider(),
        localDataProvider: LocalSearchProvider());

    final homePageRepository = HomePageRepository(dataProvider: HomeProvider());

    final loginRepository = LoginRepository(
      loginDataProvider: LoginProvider(
        httpClient: http.Client(),
      ),
    );
    final subscriptionRepository = SubscriptionRepository(
        apiProvider: OnlineSubscriptionProvider(http.Client()));
    final libraryRepository = LibraryRepository(
        apiLibraryProvider: LibraryProviderOnline(httpClient: http.Client()));

    final signupRepository = SignupRepository(
      signupProvider: SignupProvider(
        httpClient: http.Client(),
      ),
    );
    final audioRepository = AudioRepository(AudioProvider());
    final yourChannelRepository =
        YourChannelRepository(dataProvider: YourChannelProvider());
    final editProfilRepository =
        EditProfileRepository(editProfileProvider: EditProfileProvider());
    final downloadedAudioRepository =
        DownloadedAudioRepository(DownloadedAudioProvider());

    return MultiBlocProvider(
      providers: [
        BlocProvider<CreatePodcastBloc>(
          create: (context) => CreatePodcastBloc(
              CreatePodcastInitialState(), CreatePodcastRepository()),
        ),
        BlocProvider<RecorderBloc>(
            create: (context) => RecorderBloc(RecorderInitialState())),
        BlocProvider(
          create: (_) =>
              ChannelDescriptionBloc(channelRepository: channelRepository),
        ),
        BlocProvider(
            create: (_) => HomePageBloc(repository: homePageRepository)
              ..add(LoadIntialHomeEvent())),
        BlocProvider(
            create: (_) => SearchBloc(repository: searchRepository)
              ..add(LoadIntialSearchEvent())),
        BlocProvider(
            create: (_) => LoginBloc(loginRepository: loginRepository)),
        BlocProvider(
            create: (_) => SignupBloc(signupRepository: signupRepository)),
        BlocProvider(
            create: (_) => WellcomeBloc(loginRepository: loginRepository)
              ..add(HaveCredLocalWellcomeEvent())),
        BlocProvider(
          create: (_) => AudioPlayerBloc(audioRepository),
        ),
        BlocProvider(
            create: (_) => YourChannelBloc(repository: yourChannelRepository)
              ..add(IntialYourChannelEvent())),
        BlocProvider(
            create: (_) =>
                EditProfileBloc(editProfileRepository: editProfilRepository)
                  ..add(IntitalEditProfileEvent())),
        BlocProvider(
          create: (_) => DownloadBloc(downloadedAudioRepository)
            ..add(LoadInitialDownloadEvent()),
        ),
        BlocProvider(
          create: (_) => SubscriptionBloc(subscriptionRepository)
            ..add(LoadInitialSubscriptionEvent()),
        ),
        BlocProvider(
            create: (_) =>
                CreateChannelBloc(channelRepository: channelRepository)),
        BlocProvider(
          create: (_) =>
              LibraryBloc(libraryRepository)..add(LoadLibraryEvent()),
        ),
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
