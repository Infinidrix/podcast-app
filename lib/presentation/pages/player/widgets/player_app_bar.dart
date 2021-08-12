import 'package:flutter/material.dart';

class PlayerAppBar extends StatelessWidget {
  const PlayerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.keyboard_arrow_down,
            textDirection: TextDirection.ltr,
            color: Colors.white,
          ),
          Text(
            "Player",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
          Icon(
            Icons.more_horiz,
            textDirection: TextDirection.ltr,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
