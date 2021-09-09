import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/library/library_bloc.dart';
import 'package:podcast_app/application/library/library_events.dart';
import 'package:podcast_app/application/library/library_states.dart';
import 'package:podcast_app/models/Podcast.dart';

import 'Widgets/LibraryCard.dart';
import 'Widgets/firstRow.dart';

const Color mainBackGroundColor = Color(0xff121212);

class LibraryPage extends StatelessWidget {
  LibraryPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
              color: mainBackGroundColor,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FirstRowLibrary(),
                    Expanded(
                        flex: 15,
                        child: BlocBuilder<LibraryBloc, LibraryState>(
                            builder: (_, state) {
                          if (state is InitialLibraryState) {
                            if (state.podcasts.length == 0) {
                              return Center(
                                child: Text(
                                    "You have no podcasts in your library"),
                              );
                            }
                            return ListView.builder(
                              itemBuilder: (_, i) =>
                                  LibraryCard(podcast: state.podcasts[i]),
                              itemCount: state.podcasts.length,
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        })),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
