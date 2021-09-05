import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/audio_player/audio_player_states.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class AudioWithThumbnail extends StatelessWidget {
  final Podcast podcast;

  const AudioWithThumbnail({Key? key, required this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);

    return SizedBox(
      height: 160,
      width: 160,
      child: InkWell(
        highlightColor: Colors.white54,
        onTap: () async {
          print("Getting to the add event to bloc");
          // TODO: Change this from hardcoded to state
          String path = await getDocumentDir();
          audioPlayerBloc
              .add(InitializePlayerEvent(podcasts: ListQueue.from([podcast])));
          context.router.push(PlayerRoute());
        },
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    height: 150,
                    width: 155,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                          podcast.imageUrl!,
                        )))),
                Text("${podcast.Name}",
                    style: TextStyle(
                      fontSize: 18.0,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
