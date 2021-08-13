import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/edit_channel/widgets/edit_channel_widgets.dart';
import 'package:podcast_app/presentation/pages/player/widgets/bottom_navigation.dart';

class EditChannel extends StatelessWidget {
  const EditChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1A1A1A"),
      body: CustomScrollView(
        slivers: [
          EditChannelSliverAppBar(),
          DescriptionAndNumberOfListinersTile(),
          RecentlyUploadedPodcastsList()
        ],
      ),
      bottomNavigationBar: ABottomNavaigationBar(),
    );
  }
}
