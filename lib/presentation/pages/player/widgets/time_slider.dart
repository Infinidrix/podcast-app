import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/audio_player/audio_player_states.dart';

class TimeSlider extends StatefulWidget {
  const TimeSlider({Key? key}) : super(key: key);

  @override
  _TimeSliderState createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double _current_time = 0.0;

  @override
  Widget build(BuildContext context) {
    final audioPlayerBloc = BlocProvider.of<AudioPlayerBloc>(context);
    return Column(
      children: [
        BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
          builder: (_, state) {
            
            return StreamBuilder(
              stream: audioPlayerBloc.fileDuration(),
              builder:(_, AsyncSnapshot<Duration> totalDurationSnapshot) =>  StreamBuilder(
                  stream: audioPlayerBloc.currentPosition(),
                  builder: (_, AsyncSnapshot<Duration> snapshot) {
                    print("This is snapshot: " + snapshot.toString() + " " + snapshot.hasData.toString() + " " + snapshot.data.toString());
                    if (snapshot.hasData && totalDurationSnapshot.hasData) {
                      int seconds = snapshot.data!.inSeconds;
                      Duration duration = snapshot.data!;
                      Duration totalDuration = totalDurationSnapshot.data!;
                      // return Text("This is snapshot: " + snapshot.hasData.toString() + " " + snapshot.data.toString() + ": " + seconds.toString());
                      return Column(
                        children: [
                          Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            max: totalDuration.inSeconds.toDouble(),
                            value: seconds.toDouble(),
                            onChanged: (double value) {
                              audioPlayerBloc.add(SeekAudioEvent(
                                  newPosition: Duration(seconds: value.toInt())));
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${duration.inMinutes.toInt().remainder(60)}:${duration.inSeconds.toInt().remainder(60)}",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "${totalDuration.inMinutes.toInt().remainder(60)}:${totalDuration.inSeconds.toInt().remainder(60)}", 
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ); 
                    }
                    return CircularProgressIndicator();
                  }),
            );
          },
        ),
        
      ],
    );
  }
}
