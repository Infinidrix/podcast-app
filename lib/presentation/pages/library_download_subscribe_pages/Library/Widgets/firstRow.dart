import 'package:flutter/material.dart';

class FirstRowLibrary extends StatelessWidget {

  FirstRowLibrary();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Text(
          // TODO: When
          'Yesterday',
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 11,
            color: Color(0xffB3B3B3),
          ),
        ),
      ),
    );
  }
}
