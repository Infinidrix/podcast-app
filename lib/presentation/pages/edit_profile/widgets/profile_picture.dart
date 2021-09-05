import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangeProfilePricture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 73.0),
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  scale: 1),
              child: Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.add,
                  size: 40.0,
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: TextButton(
            child: Text(
              "Change Profile Picture",
              style: TextStyle(color: HexColor("#579EB5")),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
