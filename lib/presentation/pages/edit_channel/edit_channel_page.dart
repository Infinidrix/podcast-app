import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/edit_channel/widgets/edit_channel_widgets.dart';
import 'package:podcast_app/presentation/core/bottom_navigation.dart';

import 'widgets/edit_channel_widget.dart';

class EditChannelPage extends StatelessWidget {
  const EditChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1A1A1A"),
      body: EditChannel(),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
