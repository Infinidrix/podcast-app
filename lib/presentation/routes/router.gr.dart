// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../models/edit_profile/edit_profile.dart' as _i17;
import '../pages/channel_detail/channel_detail_page.dart' as _i7;
import '../pages/create_channel/create_channel_page.dart' as _i8;
import '../pages/create_podcast/create_podcast.dart' as _i12;
import '../pages/edit_channel/edit_channel_page.dart' as _i14;
import '../pages/edit_profile/profile_page.dart' as _i11;
import '../pages/home/home_page.dart' as _i6;
import '../pages/library_download_subscribe_pages/LibDownSubTabMenuPage.dart'
    as _i16;
import '../pages/player/player_page.dart' as _i9;
import '../pages/recorder/recorder_page.dart' as _i13;
import '../pages/search/search_page.dart' as _i15;
import '../pages/signin/signin_page.dart' as _i4;
import '../pages/signup/signup.dart' as _i5;
import '../pages/welcome/welcome_page.dart' as _i3;
import '../pages/your_channels/your_channels_page.dart' as _i10;

class RootRouter extends _i1.RootStackRouter {
  RootRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WelcomeRouteArgs>(
              orElse: () => const WelcomeRouteArgs());
          return _i3.WelcomePage(key: args.key);
        }),
    SigninRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SigninPage();
        }),
    SignupRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SignupPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.HomePage();
        }),
    ChannelDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChannelDetailRouteArgs>(
              orElse: () => const ChannelDetailRouteArgs());
          return _i7.ChannelDetailPage(key: args.key);
        }),
    CreateChannelRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CreateChannelRouteArgs>(
              orElse: () => const CreateChannelRouteArgs());
          return _i8.CreateChannelPage(key: args.key);
        }),
    PlayerRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.PlayerPage();
        }),
    YourChannelsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.YourChannelsPage();
        }),
    EditProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditProfileRouteArgs>();
          return _i11.EditProfilePage(key: args.key, user: args.user);
        }),
    CreatePodcastRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CreatePodcastRouteArgs>(
              orElse: () => const CreatePodcastRouteArgs());
          return _i12.CreatePodcastPage(key: args.key);
        }),
    RecorderRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i13.RecorderPage();
        }),
    EditChannelRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.EditChannelPage();
        }),
    SearchRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.SearchPage();
        }),
    LibraryDownloadSubTabMenuRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return const _i16.LibraryDownloadSubTabMenuPage();
            })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/welcome', fullMatch: true),
        _i1.RouteConfig(WelcomeRoute.name, path: '/welcome'),
        _i1.RouteConfig(SigninRoute.name, path: '/signin'),
        _i1.RouteConfig(SignupRoute.name, path: '/signup'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(ChannelDetailRoute.name, path: '/channel'),
        _i1.RouteConfig(CreateChannelRoute.name, path: '/create'),
        _i1.RouteConfig(PlayerRoute.name, path: '/player'),
        _i1.RouteConfig(YourChannelsRoute.name, path: '/your_channels'),
        _i1.RouteConfig(EditProfileRoute.name, path: '/edit_profile'),
        _i1.RouteConfig(CreatePodcastRoute.name, path: '/add_podcast'),
        _i1.RouteConfig(RecorderRoute.name, path: 'record'),
        _i1.RouteConfig(EditChannelRoute.name, path: '/edit_channel'),
        _i1.RouteConfig(SearchRoute.name, path: '/search'),
        _i1.RouteConfig(LibraryDownloadSubTabMenuRoute.name, path: '/library')
      ];
}

class WelcomeRoute extends _i1.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({_i2.Key? key})
      : super(name, path: '/welcome', args: WelcomeRouteArgs(key: key));

  static const String name = 'WelcomeRoute';
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({this.key});

  final _i2.Key? key;
}

class SigninRoute extends _i1.PageRouteInfo {
  const SigninRoute() : super(name, path: '/signin');

  static const String name = 'SigninRoute';
}

class SignupRoute extends _i1.PageRouteInfo {
  const SignupRoute() : super(name, path: '/signup');

  static const String name = 'SignupRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class ChannelDetailRoute extends _i1.PageRouteInfo<ChannelDetailRouteArgs> {
  ChannelDetailRoute({_i2.Key? key})
      : super(name, path: '/channel', args: ChannelDetailRouteArgs(key: key));

  static const String name = 'ChannelDetailRoute';
}

class ChannelDetailRouteArgs {
  const ChannelDetailRouteArgs({this.key});

  final _i2.Key? key;
}

class CreateChannelRoute extends _i1.PageRouteInfo<CreateChannelRouteArgs> {
  CreateChannelRoute({_i2.Key? key})
      : super(name, path: '/create', args: CreateChannelRouteArgs(key: key));

  static const String name = 'CreateChannelRoute';
}

class CreateChannelRouteArgs {
  const CreateChannelRouteArgs({this.key});

  final _i2.Key? key;
}

class PlayerRoute extends _i1.PageRouteInfo {
  const PlayerRoute() : super(name, path: '/player');

  static const String name = 'PlayerRoute';
}

class YourChannelsRoute extends _i1.PageRouteInfo {
  const YourChannelsRoute() : super(name, path: '/your_channels');

  static const String name = 'YourChannelsRoute';
}

class EditProfileRoute extends _i1.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i2.Key? key, required _i17.UserEditProfile user})
      : super(name,
            path: '/edit_profile',
            args: EditProfileRouteArgs(key: key, user: user));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.user});

  final _i2.Key? key;

  final _i17.UserEditProfile user;
}

class CreatePodcastRoute extends _i1.PageRouteInfo<CreatePodcastRouteArgs> {
  CreatePodcastRoute({_i2.Key? key})
      : super(name,
            path: '/add_podcast', args: CreatePodcastRouteArgs(key: key));

  static const String name = 'CreatePodcastRoute';
}

class CreatePodcastRouteArgs {
  const CreatePodcastRouteArgs({this.key});

  final _i2.Key? key;
}

class RecorderRoute extends _i1.PageRouteInfo {
  const RecorderRoute() : super(name, path: 'record');

  static const String name = 'RecorderRoute';
}

class EditChannelRoute extends _i1.PageRouteInfo {
  const EditChannelRoute() : super(name, path: '/edit_channel');

  static const String name = 'EditChannelRoute';
}

class SearchRoute extends _i1.PageRouteInfo {
  const SearchRoute() : super(name, path: '/search');

  static const String name = 'SearchRoute';
}

class LibraryDownloadSubTabMenuRoute extends _i1.PageRouteInfo {
  const LibraryDownloadSubTabMenuRoute() : super(name, path: '/library');

  static const String name = 'LibraryDownloadSubTabMenuRoute';
}
