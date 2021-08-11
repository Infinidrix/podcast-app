// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/channel_detail/channel_detail_page.dart' as _i5;
import '../pages/create_channel/create_channel_page.dart' as _i6;
import '../pages/signin/signin_page.dart' as _i4;
import '../pages/welcome/welcome_page.dart' as _i3;

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
    ChannelDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChannelDetailRouteArgs>(
              orElse: () => const ChannelDetailRouteArgs());
          return _i5.ChannelDetailPage(key: args.key);
        }),
    CreateChannelRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CreateChannelRouteArgs>(
              orElse: () => const CreateChannelRouteArgs());
          return _i6.CreateChannelPage(key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(WelcomeRoute.name, path: '/'),
        _i1.RouteConfig(SigninRoute.name, path: '/signin'),
        _i1.RouteConfig(ChannelDetailRoute.name, path: '/channel'),
        _i1.RouteConfig(CreateChannelRoute.name, path: '/create')
      ];
}

class WelcomeRoute extends _i1.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({_i2.Key? key})
      : super(name, path: '/', args: WelcomeRouteArgs(key: key));

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
