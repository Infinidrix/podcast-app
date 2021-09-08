import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/edit_channel/widgets/edit_channel_detail_widget.dart';

class EditChannelDetailPage extends StatelessWidget {
  final String Name;
  final String Description;
  dynamic Image;

  EditChannelDetailPage(
      {required this.Name, required this.Description, required this.Image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditChannelDetailWidget(Name: Name, Description: Description, Image: Image),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
