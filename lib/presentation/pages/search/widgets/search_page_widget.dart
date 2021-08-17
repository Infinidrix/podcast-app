import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/search/widgets/audio_card.dart';
import 'package:podcast_app/presentation/pages/search/widgets/channel_card.dart';
import 'package:podcast_app/presentation/pages/search/widgets/custom_text.dart';
import 'package:podcast_app/presentation/pages/search/widgets/recently_searched_widget.dart';

import '../constants.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: HexColor("#121212"),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          searchInput,
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: "Recenty Searched")),
          Recently(
            img: "assets/images/The_Weeknd.png",
            title: "The Weekend",
            subtitle: "After Hours",
          )
        ]));
  }
}

Widget searchInput = Container(
  height: 60,
  padding: EdgeInsets.only(top: 10),
  margin: EdgeInsets.only(bottom: 15),
  child: TextFormField(
    style: TextStyle(color: Colors.white),
    decoration: searchInputDecoration,
    controller: searchText,
  ),
);
