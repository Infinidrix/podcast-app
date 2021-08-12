import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/player/widgets/bottom_navigation.dart';
import 'package:podcast_app/presentation/pages/your_channels/widgets/your_channels_widgets.dart';

class YourChannelsPage extends StatelessWidget {
  const YourChannelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1A1A1A"),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            YourChannelsAppBar(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>
                    YourChannelTile(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ABottomNavaigationBar(),
    );
  }
}
