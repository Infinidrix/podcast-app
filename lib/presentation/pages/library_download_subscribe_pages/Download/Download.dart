import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_events.dart';
import 'package:podcast_app/application/download/download_states.dart';

import '../Constants.dart';
import 'Widgets/DownloadCard.dart';
import 'Widgets/ToggleFirstRow.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    final downloadBloc = BlocProvider.of<DownloadBloc>(context);
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (context, state) {
        if (state is LoadedDownloadState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ToggleRow(),
              Expanded(
                  flex: 15,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      downloadBloc.add(LoadInitialDownloadEvent());
                    },
                    child: Container(
                      color: mainBackGroundColor,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return DownloadCard(index);
                        },
                        itemCount: state.podcasts.length,
                      ),
                    ),
                  )),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
