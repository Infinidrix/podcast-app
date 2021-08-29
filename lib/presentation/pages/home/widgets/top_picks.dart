import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class TopPicks extends StatelessWidget {
  final String name;
  final String img;

  const TopPicks({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ChannelDetailRoute());
      },
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: 190,
          decoration: BoxDecoration(
            color: HexColor("#262626"),
            borderRadius: BorderRadius.circular(7.0),
          ),
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              FlutterLogo(
                size: 45,
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
