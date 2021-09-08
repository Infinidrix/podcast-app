import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/edit_channel/widgets/edit_channel_detail_widget.dart';

class EdiChannelDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditChannelDetailWidget(),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
