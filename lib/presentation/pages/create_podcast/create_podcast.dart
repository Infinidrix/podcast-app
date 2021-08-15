import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';
class CreatePodcastPage extends StatefulWidget {
  CreatePodcastPage({Key? key}) : super(key: key);

  @override
  _CreatePodcastPageState createState() => _CreatePodcastPageState();
}

class _CreatePodcastPageState extends State<CreatePodcastPage> {
  @override
  Widget build(BuildContext context) {
    return CreatePodcastWidget();
  }
}
