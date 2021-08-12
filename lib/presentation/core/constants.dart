import 'package:flutter/material.dart';

  final textfieldDecoration = InputDecoration(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    // labelText: "Email",
    // labelStyle: TextStyle(color: Colors.white),
    helperStyle: TextStyle(color: Colors.white),
    hintText: 'email',
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
