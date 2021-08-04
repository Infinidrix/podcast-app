import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class MyApp extends StatelessWidget {
  final _rootRouter = RootRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Theme.of(context),
      routerDelegate: AutoRouterDelegate(
        _rootRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _rootRouter.defaultRouteParser(),
    );
  }
}
