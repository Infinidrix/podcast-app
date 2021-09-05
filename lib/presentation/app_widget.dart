import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_application.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/application/wellcome/wellcome_bloc.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_events.dart';
import 'package:podcast_app/application/subscription/subscription_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_events.dart';
import 'package:podcast_app/data_provider/audio_provider/audio_provider.dart';
import 'package:podcast_app/data_provider/channel_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/data_provider/sugnup/signup_provider.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:podcast_app/repository/audio_repository/AudioRepository.dart';
import 'package:podcast_app/repository/login_repository.dart';
import 'package:podcast_app/repository/signup%20repository/SignupRepository.dart';
import 'package:podcast_app/data_provider/downloaded_audio_provider/downloaded_audio_provider.dart';
import 'package:podcast_app/repository/downloaded_audio_repository/download_audio_repository.dart';


class MyApp extends StatelessWidget {
  final _rootRouter = RootRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final channelRepository =
        ChannelRepository(channelProvider: ChannelPorvider());
    final loginRepository = LoginRepository(
      loginDataProvider: LoginProvider(
        httpClient: http.Client(),
      ),
    );
    final signupRepository = SignupRepository(
      signupProvider: SignupProvider(
        httpClient: http.Client(),
      ),
    );
    final audioRepository = AudioRepository(AudioProvider());
    final downloadedAudioRepository = DownloadedAudioRepository(DownloadedAudioProvider());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ChannelDescriptionBloc(channelRepository: channelRepository)
                ..add(LoadInitialEvent()),
        ),
        BlocProvider<CreatePodcastBloc>(
          create: (context) => CreatePodcastBloc(
              CreatePodcastInitialState(), CreatePodcastRepository()),
        ),
        BlocProvider<RecorderBloc>(
          create: (context) => RecorderBloc(RecorderInitialState()),
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
          create: (_) => DownloadBloc(downloadedAudioRepository)..add(LoadInitialDownloadEvent()),
        ),
        BlocProvider(
            create: (_) =>
                SubscriptionBloc()..add(LoadInitialSubscriptionEvent())),
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
