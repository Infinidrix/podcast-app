import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class YourChannelTile extends StatelessWidget {
  const YourChannelTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/1by1.png",
                height: 60,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "This American Life",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "1 year ago",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.edit_outlined,
                color: Colors.white,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "The Basement Yard is a weekly podcast hosted by Joe Santagato & featuring Danny LoPriore.",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: HexColor('#282828'),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
