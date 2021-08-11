import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/player/widgets/bottom_navigation_widget.dart';
import 'package:podcast_app/presentation/pages/player/widgets/controls_widget.dart';
import 'package:podcast_app/presentation/pages/player/widgets/player_app_bar.dart';
import 'package:podcast_app/presentation/pages/player/widgets/podcast_information.dart';
import 'package:podcast_app/presentation/pages/player/widgets/time_slider_widget.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: HexColor("#1A1A1A"),
          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: [
              PlayerAppBar(),
              Container(
                child: Image.asset("images/1by1.png"),
              ),
              PodcastInformation(),
              TimeSlider(),
              Controls()
            ],
          ),
        ),
        bottomNavigationBar: ABottomNavaigationBar(),
      ),
    );
  }
}
