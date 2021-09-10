import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';

class CreatePodcastPage extends StatelessWidget {
  final String channelId;
  CreatePodcastPage({required this.channelId});

  @override
  Widget build(BuildContext context) {
    return CreatePodcastWidget(
      channelId: this.channelId,
    );
  }
}
