import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangeProfilePricture extends StatefulWidget {
  const ChangeProfilePricture({ Key? key }) : super(key: key);

  @override
  _ChangeProfilePrictureState createState() => _ChangeProfilePrictureState();
}

class _ChangeProfilePrictureState extends State<ChangeProfilePricture> {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  color: Colors.grey,
                  width: 90.0,
                  height: 90.0,
                ),
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
            child: Text("Change Profile Picture", style: TextStyle(color: HexColor("#579EB5")),),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}