import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_route/auto_route.dart';

import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/presentation/pages/search/widgets/custom_text.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class RecentlyChannel extends StatelessWidget {
  final Channel channel;

  const RecentlyChannel({Key? key, required this.channel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final channelDetailBloc = BlocProvider.of<ChannelDescriptionBloc>(context);
    return InkWell(
      onTap: () {
        channelDetailBloc.add(LoadInitialEvent(channel: channel));
        context.router.push(ChannelDetailRoute());
      },
      child: Card(
        elevation: 20,
        color: HexColor("#282828"),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
            backgroundImage: AssetImage(channel.profile_pic),
            radius: 25,
          ),
          title: CustomText(text: "$channel.name"),
          subtitle: CustomText(text: "$channel.description"),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
