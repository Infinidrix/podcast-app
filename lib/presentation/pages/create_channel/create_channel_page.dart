import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/create_channel/widgets/create_channel_widget.dart';
class CreateChannelPage extends StatefulWidget {
  CreateChannelPage({Key? key}) : super(key: key);

  @override
  _CreateChannelPageState createState() => _CreateChannelPageState();
}

class _CreateChannelPageState extends State<CreateChannelPage> {
  @override
  Widget build(BuildContext context) {
    return CreateChannelWidget();
  }
}
