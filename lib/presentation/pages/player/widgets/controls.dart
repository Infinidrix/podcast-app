import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/audio_player/audio_player_states.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.skip_previous_outlined,
          color: Colors.white,
          size: 40,
        ),
        BlocConsumer<AudioPlayerBloc, AudioPlayerState>(
          builder: (_, state) {
              return GestureDetector(
                child: Icon(
                (state.podcast.isPlaying) ? Icons.pause_circle: Icons.play_circle,
                color: Colors.white,
                size: 60,
                ),
                onTap: () {
                  if (state.podcast.isPlaying) {
                    audioPlayerBloc.add(PauseAudioEvent());
                  } else {
                    audioPlayerBloc.add(PlayAudioEvent());
                  }},
              );
           },
          listener: (_, state) {
            print("This is the new state: " + state.toString());
          },
          
          ),
          
        Icon(
          Icons.skip_next_outlined,
          color: Colors.white,
          size: 40,
        ),
      ],
    );
  }
}
