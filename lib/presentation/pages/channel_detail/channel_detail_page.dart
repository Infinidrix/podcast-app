import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/channel_detail/widgets/channel_detail_page_widget.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
class ChannelDetailPage extends StatefulWidget {
  ChannelDetailPage({Key? key}) : super(key: key);

  @override
  _ChannelDetailPageState createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends State<ChannelDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChannelDetailWidget(),
      bottomNavigationBar: getBottomNavBar(context),
      );
  }
}
