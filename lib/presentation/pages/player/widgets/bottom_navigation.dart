import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ABottomNavaigationBar extends StatefulWidget {
  const ABottomNavaigationBar({Key? key}) : super(key: key);

  @override
  _ABottomNavaigationBarState createState() => _ABottomNavaigationBarState();
}

class _ABottomNavaigationBarState extends State<ABottomNavaigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: "Home",
          backgroundColor: HexColor("#1A1A1A"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          label: "Search",
          backgroundColor: HexColor("#1A1A1A"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bar_chart,
            color: Colors.white,
          ),
          label: "Your Library",
          backgroundColor: HexColor("#1A1A1A"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
            color: Colors.white,
          ),
          label: "Your Channel",
          backgroundColor: HexColor("#1A1A1A"),
        )
      ],
    );
  }
}
