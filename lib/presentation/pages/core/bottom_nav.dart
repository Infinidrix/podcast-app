import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

Widget getBottomNavBar(BuildContext context) {
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
    YourChannelsRoute()
  ];
  String routeName = context.routeData.path;
  print(routeName);
  int currentIndex = pageIndex[routeName] ?? 0;
  return CurvedNavigationBar(
    index: currentIndex,
    height: 60.0,
    items: <Widget>[
      Icon(
        Icons.home_outlined,
        size: 30,
        color: Colors.white,
      ),
      Icon(Icons.search_outlined, size: 30, color: Colors.white),
      Icon(Icons.compare_arrows, size: 30, color: Colors.white),
      Icon(Icons.call_split, size: 30, color: Colors.white),
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
}