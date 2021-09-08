import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:auto_route/auto_route.dart';

import 'package:podcast_app/presentation/pages/search/widgets/custom_text.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class Recently extends StatelessWidget {
  final Podcast podcast;

  const Recently({Key? key, required this.podcast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);

    return InkWell(
      onTap: () async {
        String path = await getDocumentDir();
        audioPlayerBloc
            .add(InitializePlayerEvent(podcasts: ListQueue.from([podcast])));
        context.router.push(PlayerRoute());
      },
      child: Card(
        elevation: 20,
        color: HexColor("#282828"),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
            backgroundImage: AssetImage(podcast.imageUrl!),
            radius: 25,
          ),
          title: CustomText(text: "$podcast.name"),
          subtitle: CustomText(text: "$podcast.description"),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
