import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_states.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/player/widgets/player_widgets.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);
    return Scaffold(
      body: Container(
        color: HexColor("#1A1A1A"),
        // padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: ListView(
          children: [
            PlayerAppBar(),
            BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
              builder: (_, state) =>
                Container(
                child: state.status.currentPodcast.imageUrl != null ? Image.network(state.status.currentPodcast.imageUrl!) : Image.asset("assets/images/1by1.png"),
              ),
            ),
            PodcastInformation(),
            TimeSlider(),
            Controls(),
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
