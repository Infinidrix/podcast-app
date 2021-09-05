import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/recorder/recorder_application.dart';

class Recorder extends StatelessWidget {
  const Recorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget controlButton = ControlButton(
      buttonLabel: "Start",
      onPressed: () {
        final recorderBloc = BlocProvider.of<RecorderBloc>(context);
        recorderBloc.add(StartRecording());
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: BlocConsumer<RecorderBloc, RecorderState>(
            builder: (context, recorderState) {
              if (recorderState is Recording) {
                // TODO : change the UI TO REFELECT RECORDING
                controlButton = ControlButton(
                  buttonLabel: 'Pause',
                  onPressed: () {
                    final recorderBloc = BlocProvider.of<RecorderBloc>(context);
                    recorderBloc.add(PauseRecordingEvent());
                  },
                );
              }

              if (recorderState is PauseState) {
                // TODO : change the UI TO REFELECT Pause state
                controlButton = Column(
                  children: [
                    ControlButton(
                      buttonLabel: 'Resume',
                      onPressed: () {
                        final recorderBloc =
                            BlocProvider.of<RecorderBloc>(context);
                        recorderBloc.add(ResumeRecordingEvent());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ControlButton(
                      buttonLabel: 'Stop',
                      onPressed: () {
                        final recorderBloc =
                            BlocProvider.of<RecorderBloc>(context);
                        recorderBloc.add(StopRecordingEvent());
                      },
                    ),
                  ],
                );
              }

              if (recorderState is ResumedState) {
                controlButton = ControlButton(
                  buttonLabel: 'Pause',
                  onPressed: () {
                    final recorderBloc = BlocProvider.of<RecorderBloc>(context);
                    recorderBloc.add(PauseRecordingEvent());
                  },
                );
              }
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  PageTitle(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueAccent),
                      height: 200,
                      width: 200,
                      child: Icon(
                        Icons.settings_voice_sharp,
                        color: Colors.white,
                        size: 100,
                      )),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "00 : 04 : 33",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 170,
                    child: controlButton,
                  ),
                ],
              );
            },
            listener: (context, recorderState) {
              if (recorderState is DialogState) {
                // Back to create podcast page, by reading the recorded file
                context.router.pop();
              }
            },
          ),
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  final String buttonLabel;
  final void Function()? onPressed;

  const ControlButton(
      {Key? key, required this.buttonLabel, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Recorder",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
      ),
    );
  }
}
