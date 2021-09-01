import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/audio_player/audio_player_states.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class AudioWithThumbnail extends StatelessWidget {
  final String imgStr;
  final String audioName;

  const AudioWithThumbnail(
      {Key? key, required this.imgStr, required this.audioName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);

    return InkWell(
      highlightColor: Colors.white54,
      onTap: () {
        print("Getting to the add event to bloc");
        // TODO: Change this from hardcoded to state
        audioPlayerBloc.add(InitializePlayerEvent(podcast: PodcastInfo("https://luan.xyz/files/audio/ambient_c_motion.mp3", false)));
        context.router.push(PlayerRoute());
      },
      child: SizedBox(
        height: 175,
        width: 175,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    imgStr,
                    height: 175,
                    width: 175,
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
