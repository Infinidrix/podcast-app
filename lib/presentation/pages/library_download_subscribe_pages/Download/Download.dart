import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
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
    return BlocConsumer<DownloadBloc, DownloadState>(
      builder: (context, state) {
        if (state is LoadedDownloadState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ToggleRow(),
              Expanded(
                  flex: 15,
                  child: Container(
                    color: mainBackGroundColor,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DownloadCard(index);
                      },
                      itemCount: state.podcasts.length,
                    ),
                  )),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      listener: (context, state) {
        if (state is FailedDownloadState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${state.errorMessage}"),
            duration: Duration(seconds: 2),
          ));
        } else if (state is FailedLoadedDownloadState) {
          // TODO: Find a better way for this
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${state.errorMessage}"),
            duration: Duration(seconds: 2),
          ));
        }
      },
    );
  }
}
