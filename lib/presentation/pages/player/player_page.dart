import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/player/widgets/player_widgets.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#1A1A1A"),
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
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
    );
  }
}
