import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

Widget getBottomNavBar(BuildContext context) {
  final navBloc = BlocProvider.of<BottomNavigationBloc>(context);
  Map<String, int> pageIndex = {
    "/home": 0,
    "/search": 1,
    "/library": 2,
    "/your_channels": 3
  };
  List<PageRouteInfo> routes = [
    HomeRoute(),
    SearchRoute(),
    LibraryDownloadSubTabMenuRoute(),
  ];
  String routeName = context.routeData.path;
  print(routeName);
  int currentIndex = pageIndex[routeName] ?? 0;
  return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
    listener: (context, state) {
      // TODO: implement listener
      if (state is UserNavigationState) {
        routes = [
          HomeRoute(),
          SearchRoute(),
          LibraryDownloadSubTabMenuRoute(),
        ];
      }
      if (state is CreatorNavigationState) {
        routes = [
          HomeRoute(),
          SearchRoute(),
          LibraryDownloadSubTabMenuRoute(),
          YourChannelsRoute()
        ];
      }
    },
    builder: (context, state) {
// navBloc.add(CheckRoleEvent());
      return CurvedNavigationBar(
        index: currentIndex,
        height: 60.0,
        items: (state is UserNavigationState)
            ? <Widget>[
                Icon(Icons.home_outlined, size: 30, color: Colors.white),
                Icon(Icons.search_outlined, size: 30, color: Colors.white),
                Icon(Icons.compare_arrows, size: 30, color: Colors.white),
              ]
            : (state is CreatorNavigationState)
                ? <Widget>[
                    Icon(Icons.home_outlined, size: 30, color: Colors.white),
                    Icon(Icons.search_outlined, size: 30, color: Colors.white),
                    Icon(Icons.compare_arrows, size: 30, color: Colors.white),
                    Icon(Icons.call_split, size: 30, color: Colors.white),
                  ]
                : <Widget>[
                    Icon(Icons.home_outlined, size: 30, color: Colors.white),
                    Icon(Icons.search_outlined, size: 30, color: Colors.white),
                    Icon(Icons.compare_arrows, size: 30, color: Colors.white),
                  ]

        //
        ,
        onTap: (index) {
          context.router.replace(routes[index]);
        },
        color: Color(0xff282828),
        buttonBackgroundColor: Color(0xff282828),
        backgroundColor: Color(0xff121212),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
      );
    },
  );
}
