import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class TopPicks extends StatelessWidget {
  final Channel channel;
  TopPicks({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channelDetailBloc = BlocProvider.of<ChannelDescriptionBloc>(context);
    return InkWell(
      onTap: () {
        print("podcasts");
        print(channel.id);
        channelDetailBloc.add(LoadInitialEvent(channel: channel));
        context.router.push(ChannelDetailRoute());
      },
      child: FittedBox(
        child: Container(
          height: 120,
          width: 250,
          decoration: BoxDecoration(
            color: HexColor("#262626"),
            borderRadius: BorderRadius.circular(7.0),
          ),
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage("assets/images/The_Weeknd.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: 150,
                  child: Text(
                    channel.name,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
