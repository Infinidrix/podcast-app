import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class AudioWithThumbnail extends StatelessWidget {
  final String imgStr;
  final String audioName;

  const AudioWithThumbnail(
      {Key? key, required this.imgStr, required this.audioName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white54,
      onTap: () {
        context.router.push(ChannelDetailRoute());
      },
      child: SizedBox(
        height: 175,
        width: 175,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    imgStr,
                    height: 150,
                    width: 150,
                  ),
                  Text("$audioName",
                      style: TextStyle(
                        fontSize: 18.0,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
