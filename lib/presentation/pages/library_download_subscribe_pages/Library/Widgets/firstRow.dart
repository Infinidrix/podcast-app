import 'package:flutter/material.dart';

class firstRowLibrary extends StatelessWidget {
  final String when;

   firstRowLibrary({required this.when});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Text(
          '${when}',
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 11,
            color: Color(0xffB3B3B3),
          ),
        ),
      ),
    );
  }
}
