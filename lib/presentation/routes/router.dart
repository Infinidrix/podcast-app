import 'package:podcast_app/presentation/pages/home/home_page.dart';
import 'package:auto_route/annotations.dart';
import 'package:podcast_app/presentation/pages/player/player_page.dart';
import 'package:podcast_app/presentation/pages/signin/signin_page.dart';
import 'package:podcast_app/presentation/pages/channel_detail/channel_detail_page.dart';
import 'package:podcast_app/presentation/pages/create_channel/create_channel_page.dart';

// Whenever you change this file, run the command below to generate the routes
// flutter packages pub run build_runner build
// NOTE: Make sure your Page Widget has the word 'Page' in it
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: PlayerPage, path: '/player', initial: true),
    AutoRoute(page: PlayerPage, path: '/'),
    AutoRoute(page: SigninPage, path: '/signin'),
    AutoRoute(page: ChannelDetailPage, path: '/channel'),
    AutoRoute(page: CreateChannelPage, path: '/create'),
  ],
)
class $RootRouter {}
