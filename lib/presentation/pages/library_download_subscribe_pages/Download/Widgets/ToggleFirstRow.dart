import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_states.dart';

import '../../Constants.dart';

class ToggleRow extends StatefulWidget {
  const ToggleRow({Key? key}) : super(key: key);

  @override
  _ToggleRowState createState() => _ToggleRowState();
}

class _ToggleRowState extends State<ToggleRow> {
  @override
  Widget build(BuildContext context) {
    final downloadBloc = BlocProvider.of<DownloadBloc>(context);
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (_, state) => Expanded(
        child: Container(
            color: mainBackGroundColor,
            child: Container(
              color: mainBackGroundColor,
              margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: mainBackGroundColor,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  (state is LoadedDownloadState && state.core != null &&
                                          !state.downloadProgress.isPaused)
                                      ? "Downloading"
                                      : "Not Downloading",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  color: mainBackGroundColor,
                                  child: CupertinoSwitch(
                                    value: (state is LoadedDownloadState &&
                                        state.downloadProgress.isPaused ==
                                            false &&
                                        state.core != null),
                                    activeColor: Color(0xff579EB5),
                                    trackColor: Color(0xff282828),
                                    onChanged: (state is LoadedDownloadState &&
                                            state.core != null)
                                        ? (value) => (value)
                                            ? ResumeAudioEvent()
                                            : PauseAudioEvent()
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
