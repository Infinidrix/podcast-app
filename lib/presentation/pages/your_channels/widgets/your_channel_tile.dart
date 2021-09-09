import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_bloc.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_event.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/pages/edit_channel2/edit_channel_page.dart';

import 'package:podcast_app/presentation/routes/router.gr.dart';

class YourChannelTile extends StatelessWidget {
  final Channel channel;

  const YourChannelTile({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editBloc = BlocProvider.of<EditChannelBloc>(context);

    return InkWell(
      onTap: () {
        print("inkweLL");
        editBloc.add(LoadIntialEditChannelEvent(channel: channel));
        print("2 iNKWEELL");
        context.router.push(EditChannelRoute());
        print("3 INKWELL");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  channel.ImageUrl,
                  height: 60,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          channel.Name,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1 year ago",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit_outlined),
                  onPressed: () {
                    context.router.push(EditChannelDetailRoute(channel: channel));
                  },
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                channel.Description,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: HexColor('#282828'),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
