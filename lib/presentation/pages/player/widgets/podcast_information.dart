import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/audio_player/audio_player_states.dart';

class PodcastInformation extends StatelessWidget {
  const PodcastInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      builder: (_, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
                children: [
                  Text(
                    "${state.status.currentPodcast.Name}",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    // TODO: Discuss on this
                    "Should we have a channel name here?",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  )
                ],
              ),
            ),
          GestureDetector(
            child: Icon(
              Icons.file_download_outlined,
              color: Colors.white,
              textDirection: TextDirection.ltr,
            ),
            onTap: () {
              audioPlayerBloc.add(DownloadEvent());
            },
          )
        ],
      ),
    );
  }
}
