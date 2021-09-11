import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final textfieldDecoration = InputDecoration(
  border: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  // labelText: "Email",
  // labelStyle: TextStyle(color: Colors.white),
  helperStyle: TextStyle(color: Colors.white),
  hintText: 'username',
  hintStyle: TextStyle(color: Colors.white),
  // filled: true,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.email_outlined,
    color: Colors.white,
  ),
);

final buttonDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [HexColor("#579EB5"), HexColor("#8EB9C7")]),
  borderRadius: BorderRadius.circular(20.0),
);

final buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.transparent),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
);
