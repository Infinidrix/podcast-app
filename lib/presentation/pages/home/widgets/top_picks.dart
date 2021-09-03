import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class TopPicks extends StatelessWidget {
  final String name;
  final String img;
  final String channelId;
  const TopPicks({
    Key? key,
    required this.name,
    required this.img,
    required this.channelId,
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
