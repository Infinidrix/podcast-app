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

    return BlocConsumer<AudioPlayerBloc, AudioPlayerState>(
      builder: (_, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Icon(
              Icons.skip_previous_outlined,
              color:
                  (state.status.currentIndex == 0) ? Colors.grey : Colors.white,
              size: 40,
            ),
            onTap: () {
              audioPlayerBloc.add(PlayPreviousEvent());
            },
          ),
          GestureDetector(
            child: Icon(
              (state.status.isPlaying) ? Icons.pause_circle : Icons.play_circle,
              color: Colors.white,
              size: 60,
            ),
            onTap: () {
              if (state.status.isPlaying) {
                audioPlayerBloc.add(PauseAudioEvent());
              } else {
                audioPlayerBloc.add(ResumeAudioEvent());
              }
            },
          ),
          GestureDetector(
            child: Icon(
              Icons.skip_next_outlined,
              color: (state.status.currentIndex == state.podcasts.length - 1)
                  ? Colors.grey
                  : Colors.white,
              size: 40,
            ),
            onTap: () {
              audioPlayerBloc.add(PlayNextEvent());
            },
          ),
        ],
      ),
      listener: (context, state) {
        if (state is AudioPlayerFailedState)
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${state.errorMessage}"),
            duration: Duration(seconds: 2),
          ));
      },
    );
  }
}
