import 'package:flutter/material.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/edit_channel/widgets/edit_channel_detail_widget.dart';

class EditChannelDetailPage extends StatelessWidget {
  final Channel channel;

  EditChannelDetailPage(
      {required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditChannelDetailWidget(
          channel : channel),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
