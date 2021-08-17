import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final BACKGROUND_COLOR = Colors.black26;

final searchText = TextEditingController();
final imageDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(3),
  boxShadow: [
    BoxShadow(
      spreadRadius: 1,
      color: Colors.black,
      offset: Offset(2, 2),
      blurRadius: 3,
    )
  ],
);

final searchInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
    hintText: "Channels, Episodes, Podcasters ...",
    hintStyle: TextStyle(color: Colors.white),
    filled: true,
    labelStyle: TextStyle(color: Colors.white),
    fillColor: HexColor("#282828"),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white10),
    ),
    suffix: IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.white,
      ),
      onPressed: () {
        searchText.clear();
      },
    ));
