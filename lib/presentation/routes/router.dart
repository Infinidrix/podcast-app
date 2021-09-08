import 'package:podcast_app/presentation/pages/edit_channel/edit_channel.dart';
import 'package:podcast_app/presentation/pages/edit_channel2/edit_channel_page.dart';
import 'package:auto_route/annotations.dart';
import 'package:podcast_app/presentation/pages/channel_detail/channel_detail_page.dart';
import 'package:podcast_app/presentation/pages/create_channel/create_channel_page.dart';
import 'package:podcast_app/presentation/pages/create_podcast/create_podcast.dart';
// import 'package:podcast_app/presentation/pages/edit_channel/edit_channel_page.dart';
import 'package:podcast_app/presentation/pages/edit_profile/profile_page.dart';
import 'package:podcast_app/presentation/pages/home/home_page.dart';
import 'package:podcast_app/presentation/pages/library_download_subscribe_pages/LibDownSubTabMenuPage.dart';
import 'package:podcast_app/presentation/pages/player/player_page.dart';
import 'package:podcast_app/presentation/pages/recorder/recorder_page.dart';
import 'package:podcast_app/presentation/pages/search/search_page.dart';
import 'package:podcast_app/presentation/pages/signin/signin_page.dart';
import 'package:podcast_app/presentation/pages/signup/signup.dart';
import 'package:podcast_app/presentation/pages/welcome/welcome_page.dart';
import 'package:podcast_app/presentation/pages/your_channels/your_channels_page.dart';
// Whenever you change this file, run the command below to generate the routes
// flutter packages pub run build_runner build
// NOTE: Make sure your Page Widget has the word 'Page' in it

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage, path: '/welcome', initial: true),
    AutoRoute(page: SigninPage, path: '/signin'),
    AutoRoute(page: SignupPage, path: '/signup'),
    AutoRoute(page: HomePage, path: '/home'),
    AutoRoute(page: ChannelDetailPage, path: '/channel'),
    AutoRoute(page: CreateChannelPage, path: '/create'),
    AutoRoute(page: PlayerPage, path: '/player'),
    AutoRoute(page: YourChannelsPage, path: '/your_channels',initial: true),
    AutoRoute(page: EditProfilePage, path: '/edit_profile'),
    AutoRoute(page: CreatePodcastPage, path: '/add_podcast'),
    AutoRoute(page: RecorderPage, path: 'record'),
    AutoRoute(page: EditChannelDetailPage, path: '/edit_channel_detail_page'),
    AutoRoute(
      page: EditChannelPage,
      path: '/edit_channel'
    ),
    AutoRoute(page: SearchPage, path: '/search'),
    AutoRoute(page: LibraryDownloadSubTabMenuPage, path: "/library")
  ],
)
class $RootRouter {}
