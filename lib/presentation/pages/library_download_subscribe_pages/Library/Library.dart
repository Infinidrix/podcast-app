import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/library/library_bloc.dart';
import 'package:podcast_app/application/library/library_events.dart';
import 'package:podcast_app/application/library/library_states.dart';

import 'Widgets/LibraryCard.dart';
import 'Widgets/firstRow.dart';

const Color mainBackGroundColor = Color(0xff121212);

class LibraryPage extends StatelessWidget {
  LibraryPage();

  @override
  Widget build(BuildContext context) {
    final libraryBloc = BlocProvider.of<LibraryBloc>(context);
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
                        child: BlocConsumer<LibraryBloc, LibraryState>(
                          builder: (_, state) {
                            if (state is InitialLibraryState) {
                              if (state.podcasts.length == 0) {
                                return RefreshIndicator(
                                  onRefresh: () async {
                                    libraryBloc.add(LoadLibraryEvent());
                                  },
                                  child: Center(
                                      child: ListView(
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          children: [
                                        Center(
                                            child: Text(
                                          "You have no subscribed channels",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                      ])),
                                );
                              }
                              return RefreshIndicator(
                                onRefresh: () async {
                                  libraryBloc.add(LoadLibraryEvent());
                                },
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (_, i) =>
                                      LibraryCard(podcast: state.podcasts[i]),
                                  itemCount: state.podcasts.length,
                                ),
                              );
                            } else if (state is FailedLibraryState) {
                              return RefreshIndicator(
                                onRefresh: () async {
                                  libraryBloc.add(LoadLibraryEvent());
                                },
                                child: Center(
                                    child: ListView(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        children: [
                                      Center(
                                          child: Text(
                                        "Internet Error. Please Try Again",
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                    ])),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                          listener: (context, state) {
                            if (state is FailedLibraryState) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("${state.errorMessage}"),
                                duration: Duration(seconds: 2),
                              ));
                            }
                          },
                        )),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
