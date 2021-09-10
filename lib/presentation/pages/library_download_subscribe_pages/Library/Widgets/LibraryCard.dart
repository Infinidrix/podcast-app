import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_events.dart';
import 'package:podcast_app/application/download/download_states.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

import '../../Constants.dart';

class LibraryCard extends StatelessWidget {
  final Podcast podcast;

  LibraryCard({required this.podcast});

  @override
  Widget build(BuildContext context) {
    final audioBloc = BlocProvider.of<AudioPlayerBloc>(context);
    final downloadBloc = BlocProvider.of<DownloadBloc>(context);

    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Container(
        color: mainBackGroundColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                color: secondColor,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/placeholder.jpg'),
                                  fit: BoxFit.cover)),
                        )),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${podcast.name}',
                            style: titleTextStyle,
                          ),
                          Text(
                            '${podcast.channelName}',
                            style: descriptioin_SubtitleTextStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  '${podcast.description}',
                  style: descriptioin_SubtitleTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 34, 0, 6),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            // TODO: Replace with time upload
                            'Some Time ago . ',
                            style: whenTextStyle,
                          ),
                          Text(
                            'Takes time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb3b3b3),
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            child: GestureDetector(
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              onTap: () {
                                audioBloc.add(InitializePlayerEvent(
                                    podcasts: ListQueue.from([podcast])));
                                context.router.push(PlayerRoute());
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(26, 0, 10, 0),
                            child: GestureDetector(
                                child: Icon(
                                  Icons.download_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                onTap: () {
                                  downloadBloc
                                      .add(AddToDownloadQueueEvent(podcast));
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
