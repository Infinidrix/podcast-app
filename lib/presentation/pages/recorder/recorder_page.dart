import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_state.dart';
import 'package:podcast_app/presentation/pages/recorder/widgets/recorder_widget.dart';

class RecorderPage extends StatelessWidget {
  const RecorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecorderBloc>(
      create: (context) => RecorderBloc(RecorderInitialState()),
      child: Recorder(),
    );
  }
}
