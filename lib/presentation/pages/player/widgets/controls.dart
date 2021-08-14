import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.skip_previous_outlined,
          color: Colors.white,
          size: 40,
        ),
        Icon(
          Icons.play_circle,
          color: Colors.white,
          size: 60,
        ),
        Icon(
          Icons.skip_next_outlined,
          color: Colors.white,
          size: 40,
        ),
      ],
    );
  }
}
